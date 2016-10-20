" Operator colors
syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1 nextgroup=cVars
"syn region cVars start="(" end=")" contained contains=cParameters transparent keepend
"syn match cParameters "[^,*]*" contained skipwhite

syntax match operator "="
syntax match operator "-"
syntax match operator "+"
syntax match operator "*"
syntax match operator "&"
syntax match operator "|"
syntax match operator "<"
syntax match operator ">"
syntax match operator "?"
syntax match operator ":"
syntax match operator "!"
syntax match operator "\^"
