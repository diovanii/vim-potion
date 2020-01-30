if exists("b:current_syntax")
  finish
endif

" Syntax keyword: {{{
syntax keyword potionKeyword loop while times to
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
syntax keyword potionFunction print join string
" }}}

" Syntax match: {{{
syntax match potionComment  "\v#.*$"

syntax match potionOperator "\v\="
syntax match potionOperator "\v\."
syntax match potionOperator "\v\-"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v\*"
syntax match potionOperator "\v\/"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\-\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v\/\="

syntax match potionNumber   "\v0[xX][0-9a-fA-F]+"
syntax match potionNumber   "\v[+-]?([0-9]*[.])?[0-9]+"
"}}}

" Syntax region: {{{
syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start=/\v'/ skip=/\v\\./ end=/\v'/
" }}}

" Highlight links: {{{
highlight link potionKeyword  Keyword
highlight link potionFunction Function
highlight link potionComment  Comment
highlight link potionOperator Operator
highlight link potionNumber   Number
highlight link potionString   String
"}}}

let b:current_syntax = "potionbytecode"
