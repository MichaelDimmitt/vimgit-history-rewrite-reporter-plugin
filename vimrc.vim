autocmd VimEnter *.git/COMMIT_EDITMSG call CreateOrIncrementLine()

function CreateOrIncrementLine()
  if search('This commit has been edited ', 'w') && search('times', '', line('.'))
    call IncrementEditText()
  else 
    call CreateEditText()
  endif
endfunction

function IncrementEditText()
  /This commit has been edited/ | /times/ | s/\d\+/\=(submatch(0)+1)/g
endfunction

function CreateEditText()
  $put _ | $norm AThis commit has been edited 1 times
endfunction

" to see this same code with comments added view .vimrc.vim.withcomments
