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

set tabstop=4
set shiftwidth=4

au BufRead,BufNewFile *.erb set filetype=ruby
au FileType ruby set tabstop=2
au FileType ruby set shiftwidth=2

au FileType javascript set tabstop=2
au FileType javascript set shiftwidth=2

au FileType html,htm,html.erb set tabstop=2
au FileType html,htm,html.erb set shiftwidth=2

au FileType xml set tabstop=2
au FileType xml set shiftwidth=2

"au BufRead,BufNewFile *.cs set filetype=csharp
au FileType cs set tabstop=2
au FileType cs set shiftwidth=2

au FileType css,less,scss set tabstop=2
au FileType css,less,scss set shiftwidth=2

au BufRead,BufNewFile *.java set filetype=java
au FileType java set nowrap
au FileType java set colorcolumn=100

au BufRead,BufNewFile *.as set filetype=actionscript
au FileType actionscript set nowrap
au FileType actionscript set colorcolumn=100
au FileType actionscript set tabstop=4
au FileType actionscript set shiftwidth=4

au FileType markdown set wrap
au FileType markdown set linebreak
au FileType markdown set nolist
au FileType markdown set tabstop=4
au FileType markdown set shiftwidth=4

au FileType bash set tabstop=4
au FileType bash set shiftwidth=4

au BufNewFile,BufRead *.cpp,*.c,*.h,*.hpp set nowrap
au BufNewFile,BufRead *.cpp,*.c,*.h,*.hpp set colorcolumn=120
au BufNewFile,BufRead *.cpp,*.c,*.h,*.hpp set tabstop=4
au BufNewFile,BufRead *.cpp,*.c,*.h,*.hpp set shiftwidth=4

au BufNewFile,BufRead *.ejs,*.htm,*.html set filetype=html
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.j set filetype=objj
au BufNewFile,BufRead *.dart set filetype=dart

au BufRead,BufNewFile *.pp set filetype=puppet
au FileType puppet set nowrap
au FileType puppet set colorcolumn=100
au FileType puppet set tabstop=4
au FileType puppet set shiftwidth=4

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

"brightscript / roku stuff
au BufRead,BufNewFile *.brs set filetype=brs
au FileType brs set tabstop=4
au FileType brs set shiftwidth=4

highlight SpellBad ctermbg=DarkGray

"stop it, josh
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"language-specific settings
execute 'silent! source ~/.vim/python.vim'

"project / directory specific settings
set secure
set exrc
