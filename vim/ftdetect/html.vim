" salesforce / apex html settings
au BufRead,BufNewFile *.page set filetype=html
au BufRead,BufNewFile *.vfp set filetype=html
au BufNewFile,BufRead *.ejs,*.htm,*.html set filetype=html

" standard html settings
au FileType html,htm,html.erb set tabstop=2
au FileType html,htm,html.erb set shiftwidth=2
