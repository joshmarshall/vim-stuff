if exists("current_compiler")
    finish
endif

let current_compiler = "gjslint"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=(gjslint\ --unix_mode\ %)
CompilerSet errorformat=%f:%l:%m
set errorformat+=\%-G%.%#

augroup gjslinter
    au!
    au BufWritePost * call GJSLint()
augroup end

function! GJSLint()
    write
    setlocal sp=>%s\ 2>&1
    silent make!
    cwindow

    let l:error = 0
    let l:list = getqflist()
    for l:item in l:list
        if !l:error
            let l:error = 1
        endif
    endfor

    if l:error
        cc
    endif
endfunction
