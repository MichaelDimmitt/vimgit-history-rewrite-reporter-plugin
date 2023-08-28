
" command breakdown: 
" 1. When this file becomes active in vim run the commands to the right of this command:
" -----> autocmd VimEnter *.git/COMMIT_EDITMSG
" 2. call IncrementEditText function

" placeholder command till if statement is added that creates the string if it does not exist
" autocmd VimEnter *.git/COMMIT_EDITMSG $r! date
" autocmd VimEnter *.git/COMMIT_EDITMSG /This commit has been edited/ | s/\d\+/\=(submatch(0)+1)/g

autocmd VimEnter *.git/COMMIT_EDITMSG call CreateOrIncrementLine()

function CreateOrIncrementLine()
  " command breakdown:
  " search() is used instead of /<your word>/ because search() fails gracefully.
  " | ensures the second command runs only when the first command succeeds.
  " search('times', '', line('.')), searches the current line that the cursor is on.
  if search('This commit has been edited ', 'w') && search('times', '', line('.'))
    call IncrementEditText()
  else 
    call CreateEditText()
  endif
endfunction

function IncrementEditText()
  " command breakdown:
  " 1. Move the cursor to the line that has the following text "This commit has been edited"
  " -----> /This commit has been edited/
  " 2. If the first command succeeds run the second command
  " ----->  |
  " 3. given the current cursors line replace the current number found with itself + 1.
  " -----> s/\d\+/\=(submatch(0)+1)/g
  /This commit has been edited/ | /times/ | s/\d\+/\=(submatch(0)+1)/g
endfunction

function CreateEditText()
  " https://superuser.com/a/303415/644627
  " command breakdown:
  " 1. Add a new line to the end of the file this also puts the cursor at the end of the file
  " 2. If the first command succeeds run the second command
  " 3. Execute a normal command at the end of the file to write the following text "This file has been edited 0 times"
  $put _ | $norm AThis commit has been edited 1 times
endfunction
