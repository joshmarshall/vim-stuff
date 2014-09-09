au FileType python set tabstop=4
au FileType python set shiftwidth=4
au FileType python set textwidth=79
au FileType python set colorcolumn=80

autocmd BufWritePost *.py call Flake8()
