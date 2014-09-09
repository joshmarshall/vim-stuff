" Markdown
autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown

au FileType markdown set wrap
au FileType markdown set linebreak
au FileType markdown set nolist
au FileType markdown set tabstop=4
au FileType markdown set shiftwidth=4
