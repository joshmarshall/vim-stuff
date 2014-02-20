if !exists("puppetlint_command")
    let puppetlint_command = "~/.vim/puppetlint.py"
endif

autocmd BufWritePost,FileWritePost *.pp call PuppetLint()


function PuppetLint()

    set lazyredraw
    cclose

    let current_file = shellescape(expand('%:p'))
    let &grepformat="%l: %m"
    let &grepprg=g:puppetlint_command.' '.current_file
    silent! grep! %

    let has_results=getqflist() != []
    if has_results
        execute 'belowright copen'
        setlocal wrap
        nnoremap <buffer> <silent> c :cclose<CR>
        nnoremap <buffer> <silent> q :cclose<CR>
    endif

    set nolazyredraw
    redraw!

endfunction
