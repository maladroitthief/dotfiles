syn match qfFileName /^[^│ ]*/ nextgroup=qfSeparatorLeft
syn match qfSeparatorLeft /│/ contained nextgroup=qfLineNr
syn match qfLineNr /[^│]*/ contained nextgroup=qfSeparatorRight
syn match qfSeparatorRight '│' contained nextgroup=qfError,qfWarning,qfInfo,qfNote
syn match qfError /E .*$/ contained
syn match qfWarning /W .*$/ contained
syn match qfInfo /I .*$/ contained
syn match qfNote /[NH] .*$/ contained
