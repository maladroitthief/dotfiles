import lldb

def array_summary(valobj, internal_dict):
    try:
        raw_val = valobj.GetNonSyntheticValue() if hasattr(valobj, "GetNonSyntheticValue") else valobj
        if not raw_val.IsValid():
            raw_val = valobj
            
        count_member = raw_val.GetChildMemberWithName("count")
        data_member = raw_val.GetChildMemberWithName("data")
        
        if not count_member.IsValid() or not data_member.IsValid():
            return ""
            
        count = count_member.GetValueAsUnsigned(0)
        base_addr = data_member.GetValueAsUnsigned(0)
        
        if count == 0:
            return "[0] {}"
        if base_addr == 0:
            return f"[{count}] <Null Pointer>"
            
        element_type = data_member.GetType().GetCanonicalType().GetPointeeType().GetCanonicalType()
        stride = element_type.GetByteSize()
        if stride == 0:
            return f"[{count}]"
            
        preview_max = min(count, 6)
        
        # OPTIMIZATION: Extract raw bytes directly out of memory cache without spawning SBValues
        sb_data = data_member.GetPointeeData(0, preview_max)
        if not sb_data.IsValid():
            return f"[{count}]"
            
        type_name = element_type.GetName().lower()
        error = lldb.SBError()
        elements = []
        
        for i in range(preview_max):
            offset = i * stride
            if stride == 1:
                val = sb_data.GetUnsignedInt8(error, offset)
                elements.append(str(val))
            elif stride == 2:
                val = sb_data.GetUnsignedInt16(error, offset)
                elements.append(str(val))
            elif stride == 4:
                if "float" in type_name or "f32" in type_name:
                    val = sb_data.GetFloat(error, offset)
                else:
                    val = sb_data.GetUnsignedInt32(error, offset)
                elements.append(str(val))
            elif stride == 8:
                if "double" in type_name or "f64" in type_name:
                    val = sb_data.GetDouble(error, offset)
                else:
                    val = sb_data.GetUnsignedInt64(error, offset)
                elements.append(str(val))
            else:
                elements.append("{...}")
                break
                
        if count > preview_max:
            elements.append("...")
            
        return f"[{count}] {{{', '.join(elements)}}}"
    except:
        return f"[{count}]"

def array_synthetic_children(valobj, internal_dict):
    class ArraySynthProvider:
        def __init__(self, valobj):
            raw_val = valobj.GetNonSyntheticValue() if hasattr(valobj, "GetNonSyntheticValue") else valobj
            self.valobj = raw_val if raw_val.IsValid() else valobj
            self.count = 0
            self.base_element = None
            self.element_type = None
            self.stride = 0
            self.update()

        def num_children(self):
            # OPTIMIZATION: Safety cap the structural tree elements at 5,000 rows.
            # This stops nvim-dap from locking up on huge allocations. You still see the 
            # full total count (e.g. [40585]) in your summary preview line above it.
            return min(self.count, 5000)

        def get_child_index(self, name):
            try:
                return int(name.lstrip("[").rstrip("]"))
            except:
                return -1

        def get_child_at_index(self, index):
            try:
                if index < 0 or index >= self.num_children():
                    return None
                if not self.base_element or not self.base_element.IsValid():
                    return None
                    
                offset = index * self.stride
                # OPTIMIZATION: CreateChildAtOffset is orders of magnitude faster than 
                # CreateValueFromAddress because it runs inside the existing value context tree
                return self.base_element.CreateChildAtOffset(f"[{index}]", offset, self.element_type)
            except:
                return None

        def update(self):
            try:
                count_member = self.valobj.GetChildMemberWithName("count")
                data_member = self.valobj.GetChildMemberWithName("data")
                
                if count_member.IsValid() and data_member.IsValid():
                    self.count = count_member.GetValueAsUnsigned(0)
                    
                    data_type = data_member.GetType().GetCanonicalType()
                    pointee_type = data_type.GetPointeeType()
                    
                    if pointee_type.IsValid():
                        self.element_type = pointee_type.GetCanonicalType()
                        self.stride = self.element_type.GetByteSize()
                        # Cache the dereferenced pointer location as a base element
                        self.base_element = data_member.Dereference()
                    else:
                        self.element_type = None
                        self.base_element = None
                        self.stride = 0
                else:
                    self.count = 0
                    self.base_element = None
                    self.element_type = None
                    self.stride = 0
            except:
                self.count = 0
                self.base_element = None
                self.element_type = None
                self.stride = 0

        def has_children(self):
            return self.count > 0

    return ArraySynthProvider(valobj)

def __lldb_init_module(debugger, internal_dict):
    commands = [
        'type summary add -x ".*array_view.*" -F jai_lldb.array_summary -w jai',
        'type synthetic add -x ".*array_view.*" -l jai_lldb.array_synthetic_children -w jai',
        
        'type summary add -x ".*dynamic_array.*" -F jai_lldb.array_summary -w jai',
        'type synthetic add -x ".*dynamic_array.*" -l jai_lldb.array_synthetic_children -w jai',
        
        'type summary add -x ".*\[\].*" -F jai_lldb.array_summary -w jai',
        'type synthetic add -x ".*\[\].*" -l jai_lldb.array_synthetic_children -w jai',
        
        'type summary add -x ".*string.*" -F jai_lldb.array_summary -w jai',
        'type synthetic add -x ".*string.*" -l jai_lldb.array_synthetic_children -w jai'
    ]

    for cmd in commands:
        debugger.HandleCommand(cmd)

    debugger.HandleCommand("type category enable jai")
