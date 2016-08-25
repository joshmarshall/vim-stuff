" Markdown
autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=markdown |
      \ else |
      \   setf markdown |
      \ endif

au FileType markdown set linebreak
au FileType markdown set nolist
au FileType markdown set tabstop=4
au FileType markdown set shiftwidth=4

au FileType markdown set textwidth=79
au FileType markdown set colorcolumn=80
