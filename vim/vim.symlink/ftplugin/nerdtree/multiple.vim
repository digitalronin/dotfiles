" Based on this;
"
"     https://gist.github.com/scrooloose/5eedbf80a4c62d01d25c
"     https://github.com/scrooloose/nerdtree/issues/49

if exists("g:loaded_nerdtree_open_multiple")
    finish
endif
let g:loaded_nerdtree_open_multiple=1

" Select lines with Shift-V and then press o to open or d to delete
" WARNING: Deleting happens immediately, with no confirmation step.
 
vnoremap <buffer> o :call <SID>OpenMultiple()<cr>
vnoremap <buffer> d :call <SID>DeleteMultiple()<cr>

function! s:DeleteMultiple() range
    let curLine = a:firstline
    while curLine <= a:lastline
        call cursor(curLine, 1)
        let node = g:NERDTreeFileNode.GetSelected()
        if !empty(node) && !node.path.isDirectory
            call node.delete()
        endif
 
        let curLine += 1
    endwhile
    call NERDTreeRender()
endfunction
 
function! s:OpenMultiple() range
    let curLine = a:firstline
    while curLine <= a:lastline
        call cursor(curLine, 1)
        let node = g:NERDTreeFileNode.GetSelected()
        if !empty(node) && !node.path.isDirectory
            if curLine == a:firstline
                "open the first one in the previous window
                call node.open({'where': 'p', 'stay': 1})
            else
                call node.open({'where': 'h', 'stay': 1})
            endif
        endif
 
        let curLine += 1
    endwhile
endfunction
