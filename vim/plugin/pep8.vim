" File:         pep8.vim
" Author:       Joe Stelmach (joe@zenbe.com)
" Version:      0.2
" Description:  Shamelessly copied from javaScriptLint.vim by Josh Marshall.
" Last Modified: July 27, 2012

if !exists("pep8_command")
  let pep8_command = 'pep8 --repeat --ignore=E126'
endif

" set up auto commands
autocmd BufWritePost,FileWritePost *.py call Pep8()

function Pep8()
  let current_file = shellescape(expand('%:p'))
  let s:errorformat = "%f:%l:%c:\ %m"
  cexpr system(g:pep8_command . ' ' . current_file)
endfunction
