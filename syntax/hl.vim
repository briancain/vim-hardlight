" Vim syntax file
" Language:   HashiCorp Hardlight (HL)
" Maintainer: Brian Cain
" Repository: https://github.com/briancain/vim-hardlight
" License:    Vim

if exists('b:current_syntax')
  finish
end

syn match hlVariable /\<[A-Za-z0-9_.\[\]*]\+\>/

syn match hlParenthesis /(/
syn match hlFunction    /\w\+(/ contains=hlParenthesis

syn keyword hlKeyword for in if fn let priv

syn region hlString start=/"/ end=/"/ contains=hlEscape,hlInterpolation
syn region hlString start=/<<-\?\z([A-Z]\+\)/ end=/^\s*\z1/ contains=hlEscape,hlInterpolation

syn match hlEscape /\\n/
syn match hlEscape /\\r/
syn match hlEscape /\\t/
syn match hlEscape /\\"/
syn match hlEscape /\\\\/
syn match hlEscape /\\u\x\{4\}/
syn match hlEscape /\\u\x\{8\}/

syn match hlNumber /\<\d\+\%([eE][+-]\?\d\+\)\?\>/
syn match hlNumber /\<\d*\.\d\+\%([eE][+-]\?\d\+\)\?\>/
syn match hlNumber /\<0[xX]\x\+\>/

syn keyword hlConstant true false nil

syn region hlInterpolation start=/\${/ end=/}/ contained contains=hlInterpolation

syn region hlComment start=/\/\// end=/$/    contains=hlTodo
" syn region hlComment start=/\#/   end=/$/    contains=hlTodo
" syn region hlComment start=/\/\*/ end=/\*\// contains=hlTodo

syn match hlAttributeName /\w\+/ contained
syn match hlAttribute     /^[^=]\+=/ contains=hlAttributeName,hlComment,hlString

syn match hlBlockName /\w\+/ contained
syn match hlBlock     /^[^=]\+{/ contains=hlBlockName,hlComment,hlString

syn keyword hlTodo TODO FIXME XXX DEBUG NOTE contained

hi def link hlVariable      PreProc
hi def link hlFunction      Function
hi def link hlKeyword       Keyword
hi def link hlString        String
hi def link hlEscape        Special
hi def link hlNumber        Number
hi def link hlConstant      Constant
hi def link hlInterpolation PreProc
hi def link hlComment       Comment
hi def link hlTodo          Todo
hi def link hlBlockName     Structure

let b:current_syntax = 'hl'
