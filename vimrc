syntax on
filetype on
filetype plugin on
filetype indent on
set expandtab
set autoindent
set showmatch
set ruler
set hlsearch
set incsearch
set background=dark

"colorscheme zenburn
"defaults for unknown files

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" misc file types
au BufNewFile,BufRead *.ejs,*.htm,*.html set filetype=html
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.j set filetype=objj
au BufNewFile,BufRead *.dart set filetype=dart

au BufRead,BufNewFile *.coffee set filetype=coffee
autocmd FileType coffee compiler espresso

"pago screenplay format
au BufRead,BufNewFile *.pago set filetype=pago

"opengl stuff
au BufRead,BufNewFile *.frag,*.vert,*.glsl setf glsl

"json settings
au BufRead,BufNewFile *.json set filetype=json
au FileType json set tabstop=2
au FileType json set shiftwidth=2

highlight SpellBad ctermbg=DarkGray

"stop it, josh
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"project / directory specific settings
set secure
set exrc
