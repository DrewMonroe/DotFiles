" This detects python docstrings
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
" Make def and class be definitions so I can set their own color
syn keyword pythonDefinition def class nextgroup=pythonFunction skipwhite
syn match pythonFunction "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonVars
" Make python funciton variables be highlighted
syn region pythonVars start="(" end=")" contained contains=pythonParameters transparent keepend
syn match pythonParameters "[^(,.)]*" contained skipwhite
" Highlight self
syn keyword pythonSelf self
syn keyword Boolean True
syn keyword Boolean False

" Operator colors
syntax match operator "="
syntax match operator "-"
syntax match operator "+"
syntax match operator "/"
syntax match operator "*"
syntax match operator "&"
syntax match operator "|"
syntax match operator "<"
syntax match operator ">"
