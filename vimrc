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
au BufNewFile,BufRead *.j set filetype=objj
au BufNewFile,BufRead *.dart set filetype=dart

"pago screenplay format
au BufRead,BufNewFile *.pago set filetype=pago

"opengl stuff
au BufRead,BufNewFile *.frag,*.vert,*.glsl setf glsl

highlight SpellBad ctermbg=DarkGray

"stop it, josh
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"project / directory specific settings
set secure
set exrc

"for force.com stuff
let g:apex_backup_folder="/tmp/apex-backup"
let g:apex_temp_folder="/tmp/apex-temp"
let g:apex_properties_folder="/tmp/apex-properties"
let g:apex_tooling_force_dot_com_path="~/bin/tooling-force.com.jar"
