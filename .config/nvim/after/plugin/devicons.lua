local devicons = require('nvim-web-devicons')

local folder = "";
local document = "";
local audio = "";
local image = "";
local code = "*";
local curly = "";
local bracket = "󰅴";
local lisp = "󰘧";
local lambda = "󰘧";
local style = "";
local script = "";
local markdown = "󰦨";

local replace = document;

devicons.setup {
    color_icons = true,
    default = true,
    strict = false,
    override_by_filename = {
        [".babelrc"] = { icon = script },
        [".bash_profile"] = { icon = script },
        [".bashrc"] = { icon = script },
        [".dockerignore"] = { icon = document },
        [".ds_store"] = { icon = document },
        [".editorconfig"] = { icon = document },
        [".env"] = { icon = script },
        [".eslintrc"] = { icon = script },
        [".eslintignore"] = { icon = document },
        [".gitattributes"] = { icon = document },
        [".gitconfig"] = { icon = document },
        [".gitignore"] = { icon = document },
        [".gitlab-ci.yml"] = { icon = script },
        [".gitmodules"] = { icon = document },
        [".gvimrc"] = { icon = script },
        [".luaurc"] = { icon = script },
        [".npmignore"] = { icon = document },
        [".npmrc"] = { icon = script },
        [".settings.json"] = { icon = curly },
        [".vimrc"] = { icon = script },
        [".zprofile"] = { icon = script },
        [".zshenv"] = { icon = script },
        [".zshrc"] = { icon = script },
        ["_gvimrc"] = { icon = script },
        ["_vimrc"] = { icon = script },
        ["R"] = { icon = replace },
        ["avif"] = { icon = replace },
        ["brewfile"] = { icon = script },
        ["build"] = { icon = document },
        ["cmakelists.txt"] = { icon = document },
        ["commit_editmsg"] = { icon = document },
        ["compose.yaml"] = { icon = script },
        ["compose.yml"] = { icon = script },
        ["containerfile"] = { icon = script },
        ["copying"] = { icon = replace },
        ["copying.lesser"] = { icon = replace },
        ["docker-compose.yaml"] = { icon = script },
        ["docker-compose.yml"] = { icon = script },
        ["dockerfile"] = { icon = script },
        ["favicon.ico"] = { icon = document },
        ["gemfile$"] = { icon = document },
        ["gnumakefile"] = { icon = document },
        ["groovy"] = { icon = code },
        ["gruntfile"] = { icon = replace },
        ["gulpfile"] = { icon = replace },
        ["license"] = { icon = replace },
        ["makefile"] = { icon = replace },
        ["mix.lock"] = { icon = replace },
        ["node_modules"] = { icon = curly },
        ["package.json"] = { icon = curly },
        ["package-lock.json"] = { icon = curly },
        ["procfile"] = { icon = replace },
        ["py.typed"] = { icon = code },
        ["r"] = { icon = replace },
        ["rakefile"] = { icon = document },
        ["rmd"] = { icon = replace },
        ["svelte.config.js"] = { icon = code },
        ["tailwind.config.js"] = { icon = code },
        ["tailwind.config.mjs"] = { icon = code },
        ["tailwind.config.ts"] = { icon = code },
        ["tsconfig.json"] = { icon = curly },
        ["unlicense"] = { icon = document },
        ["vagrantfile$"] = { icon = script },
        ["webpack"] = { icon = document },
        ["workspace"] = { icon = document },
    },
    override_by_extension = {
        ["Dockerfile"] = { icon = script },
        ["R"] = { icon = replace },
        ["aac"] = { icon = replace },
        ["ai"] = { icon = replace },
        ["app"] = { icon = replace },
        ["applescript"] = { icon = script },
        ["awk"] = { icon = replace },
        ["azcli"] = { icon = replace },
        ["bash"] = { icon = script },
        ["bat"] = { icon = script },
        ["bazel"] = { icon = replace },
        ["bib"] = { icon = replace },
        ["bmp"] = { icon = image },
        ["bzl"] = { icon = replace },
        ["c"] = { icon = code },
        ["c++"] = { icon = code },
        ["cbl"] = { icon = code },
        ["cc"] = { icon = replace },
        ["ccm"] = { icon = replace },
        ["cfg"] = { icon = replace },
        ["cjs"] = { icon = code },
        ["clj"] = { icon = lisp },
        ["cljc"] = { icon = lisp },
        ["cljs"] = { icon = lisp },
        ["cljd"] = { icon = lisp },
        ["cmake"] = { icon = script },
        ["cob"] = { icon = replace },
        ["cobol"] = { icon = code },
        ["coffee"] = { icon = code },
        ["conf"] = { icon = document },
        ["config.ru"] = { icon = document },
        ["cp"] = { icon = code },
        ["cpp"] = { icon = code },
        ["cppm"] = { icon = code },
        ["cpy"] = { icon = replace },
        ["cr"] = { icon = replace },
        ["cs"] = { icon = code },
        ["csh"] = { icon = script },
        ["cshtml"] = { icon = bracket },
        ["cson"] = { icon = replace },
        ["csproj"] = { icon = bracket },
        ["css"] = { icon = style },
        ["csv"] = { icon = document },
        ["cts"] = { icon = replace },
        ["cu"] = { icon = replace },
        ["cuh"] = { icon = replace },
        ["cxx"] = { icon = code },
        ["cxxm"] = { icon = code },
        ["d"] = { icon = replace },
        ["dart"] = { icon = code },
        ["db"] = { icon = document },
        ["desktop"] = { icon = replace },
        ["diff"] = { icon = replace },
        ["doc"] = { icon = document },
        ["docx"] = { icon = document },
        ["drl"] = { icon = replace },
        ["dropbox"] = { icon = replace },
        ["dump"] = { icon = document },
        ["edn"] = { icon = replace },
        ["eex"] = { icon = replace },
        ["ejs"] = { icon = code },
        ["elf"] = { icon = replace },
        ["elm"] = { icon = code },
        ["eot"] = { icon = replace },
        ["epp"] = { icon = replace },
        ["erb"] = { icon = bracket },
        ["erl"] = { icon = code },
        ["ex"] = { icon = code },
        ["exe"] = { icon = code },
        ["exs"] = { icon = code },
        ["f#"] = { icon = code },
        ["f90"] = { icon = replace },
        ["flac"] = { icon = audio },
        ["fnl"] = { icon = replace },
        ["fish"] = { icon = script },
        ["fs"] = { icon = code },
        ["fsi"] = { icon = replace },
        ["fsscript"] = { icon = script },
        ["fsx"] = { icon = replace },
        ["gd"] = { icon = code },
        ["gemspec"] = { icon = script },
        ["gif"] = { icon = image },
        ["git"] = { icon = document },
        ["glb"] = { icon = replace },
        ["gnumakefile"] = { icon = script },
        ["go"] = { icon = code },
        ["godot"] = { icon = code },
        ["gql"] = { icon = curly },
        ["graphql"] = { icon = curly },
        ["h"] = { icon = code },
        ["haml"] = { icon = curly },
        ["hx"] = { icon = code },
        ["hbs"] = { icon = replace },
        ["heex"] = { icon = replace },
        ["hh"] = { icon = code },
        ["hpp"] = { icon = code },
        ["hrl"] = { icon = replace },
        ["hs"] = { icon = lambda },
        ["htm"] = { icon = bracket },
        ["html"] = { icon = bracket },
        ["huff"] = { icon = replace },
        ["hurl"] = { icon = replace },
        ["hxx"] = { icon = code },
        ["ixx"] = { icon = replace },
        ["ico"] = { icon = image },
        ["import"] = { icon = replace },
        ["ini"] = { icon = replace },
        ["ino"] = { icon = replace },
        ["java"] = { icon = code },
        ["jl"] = { icon = code },
        ["jpeg"] = { icon = image },
        ["jpg"] = { icon = image },
        ["js"] = { icon = code },
        ["json"] = { icon = curly },
        ["json5"] = { icon = curly },
        ["jsonc"] = { icon = curly },
        ["jsx"] = { icon = bracket },
        ["jxl"] = { icon = replace },
        ["ksh"] = { icon = script },
        ["kt"] = { icon = code },
        ["kts"] = { icon = code },
        ["leex"] = { icon = replace },
        ["less"] = { icon = style },
        ["lhs"] = { icon = lambda },
        ["license"] = { icon = replace },
        ["liquid"] = { icon = replace },
        ["lock"] = { icon = document },
        ["log"] = { icon = replace },
        ["lua"] = { icon = code },
        ["luau"] = { icon = code },
        ["mpp"] = { icon = replace },
        ["m4a"] = { icon = replace },
        ["m4v"] = { icon = replace },
        ["makefile"] = { icon = script },
        ["markdown"] = { icon = markdown },
        ["material"] = { icon = replace },
        ["md"] = { icon = markdown },
        ["mdx"] = { icon = markdown },
        ["mint"] = { icon = replace },
        ["mjs"] = { icon = code },
        ["mk"] = { icon = script },
        ["mkv"] = { icon = script },
        ["ml"] = { icon = code },
        ["mli"] = { icon = code },
        ["mo"] = { icon = replace },
        ["mov"] = { icon = audio },
        ["mp3"] = { icon = audio },
        ["mp4"] = { icon = audio },
        ["mts"] = { icon = replace },
        ["mustache"] = { icon = replace },
        ["nim"] = { icon = replace },
        ["nix"] = { icon = replace },
        ["nswag"] = { icon = replace },
        ["ogg"] = { icon = audio },
        ["opus"] = { icon = replace },
        ["org"] = { icon = markdown },
        ["otf"] = { icon = replace },
        ["out"] = { icon = replace },
        ["pck"] = { icon = replace },
        ["pdf"] = { icon = document },
        ["php"] = { icon = code },
        ["pl"] = { icon = replace },
        ["pm"] = { icon = replace },
        ["png"] = { icon = image },
        ["pp"] = { icon = replace },
        ["ppt"] = { icon = replace },
        ["prisma"] = { icon = replace },
        ["pro"] = { icon = code },
        ["ps1"] = { icon = script },
        ["psd1"] = { icon = script },
        ["psm1"] = { icon = replace },
        ["psb"] = { icon = replace },
        ["psd"] = { icon = replace },
        ["pxd"] = { icon = replace },
        ["pxi"] = { icon = replace },
        ["py"] = { icon = code },
        ["pyc"] = { icon = code },
        ["pyd"] = { icon = code },
        ["pyi"] = { icon = code },
        ["pyo"] = { icon = code },
        ["pyx"] = { icon = code },
        ["query"] = { icon = script },
        ["r"] = { icon = replace },
        ["rake"] = { icon = replace },
        ["razor"] = { icon = replace },
        ["rb"] = { icon = code },
        ["res"] = { icon = code },
        ["resi"] = { icon = replace },
        ["rlib"] = { icon = replace },
        ["rmd"] = { icon = replace },
        ["rproj"] = { icon = replace },
        ["rs"] = { icon = code },
        ["rss"] = { icon = replace },
        ["sass"] = { icon = style },
        ["sbt"] = { icon = replace },
        ["scala"] = { icon = code },
        ["scm"] = { icon = lisp },
        ["scss"] = { icon = style },
        ["sh"] = { icon = script },
        ["sig"] = { icon = replace },
        ["slim"] = { icon = replace },
        ["sln"] = { icon = replace },
        ["sml"] = { icon = replace },
        ["sol"] = { icon = replace },
        ["spec.js"] = { icon = code },
        ["spec.jsx"] = { icon = bracket },
        ["spec.ts"] = { icon = code },
        ["spec.tsx"] = { icon = bracket },
        ["sql"] = { icon = script },
        ["sqlite"] = { icon = document },
        ["sqlite3"] = { icon = document },
        ["styl"] = { icon = style },
        ["sublime"] = { icon = replace },
        ["suo"] = { icon = replace },
        ["sv"] = { icon = replace },
        ["svelte"] = { icon = bracket },
        ["svh"] = { icon = replace },
        ["svg"] = { icon = image },
        ["swift"] = { icon = code },
        ["t"] = { icon = replace },
        ["tbc"] = { icon = replace },
        ["tcl"] = { icon = replace },
        ["templ"] = { icon = replace },
        ["terminal"] = { icon = replace },
        ["test.js"] = { icon = code },
        ["test.jsx"] = { icon = bracket },
        ["test.ts"] = { icon = code },
        ["test.tsx"] = { icon = bracket },
        ["tex"] = { icon = code },
        ["tf"] = { icon = script },
        ["tfvars"] = { icon = script },
        ["toml"] = { icon = document },
        ["tres"] = { icon = replace },
        ["ts"] = { icon = code },
        ["tscn"] = { icon = replace },
        ["tsx"] = { icon = bracket },
        ["ttf"] = { icon = replace },
        ["twig"] = { icon = replace },
        ["txt"] = { icon = document },
        ["v"] = { icon = code },
        ["vala"] = { icon = replace },
        ["vh"] = { icon = code },
        ["vhd"] = { icon = code },
        ["vhdl"] = { icon = code },
        ["vim"] = { icon = replace },
        ["vsh"] = { icon = script },
        ["vue"] = { icon = bracket },
        ["wav"] = { icon = audio },
        ["webm"] = { icon = replace },
        ["webmanifest"] = { icon = replace },
        ["webp"] = { icon = replace },
        ["webpack"] = { icon = replace },
        ["woff"] = { icon = audio },
        ["woff2"] = { icon = audio },
        ["xaml"] = { icon = bracket },
        ["xcplayground"] = { icon = replace },
        ["xls"] = { icon = document },
        ["xlsx"] = { icon = document },
        ["xml"] = { icon = bracket },
        ["xul"] = { icon = replace },
        ["yaml"] = { icon = script },
        ["yml"] = { icon = script },
        ["zig"] = { icon = code },
        ["zsh"] = { icon = script },
        ["wasm"] = { icon = code },
    },
}

devicons.refresh()
