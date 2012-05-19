function! QuickFixExefun(cmd)
    let cmd_outfile = system(a:cmd)

    if cmd_outfile == ""
        echohl WarningMsg |
                    \  echomsg "Error:not find" |
                    \  echohl None
        return
    endif
    
    let tmpfile = tempname()
    exe "redir! >" . tmpfile
    echon cmd_outfile
    redir END

    exe "silent! cgetfile " . tmpfile 
    botright copen

    call delete(tmpfile)
endfunction
