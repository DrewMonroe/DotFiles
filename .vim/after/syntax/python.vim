" This detects python docstrings
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
" Make def and class be definitions so I can set their own color
syn keyword pythonDefinition def class nextgroup=pythonFunction skipwhite
syn match   pythonFunction
      \ "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonVars
" Make python function variables be highlighted
syn region pythonVars start="(" end=")" contained contains=pythonParameters transparent keepend
syn match pythonParameters "[^,().]*" contained skipwhite
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

" Really janky code that I need to override some default highlighting.
" Sometimes, things after a '.' would be highlighted like pythonParamters.
" This is due to the fact that it would be recognized as a pythonAttribute
" (and thus be highlighted accordingly) due to the fact that it was included
" as such in the default python.vim highlighting. In order to fix it, I need
" to clear the old highlighting, and then replace with mine. Awful, I know,
" but it works
syntax clear pythonAttribute
syntax match pythonAttribute /\.\h\w*/hs=s+1 contains=ALLBUT,pythonBuiltin,pythonParameters transparent
