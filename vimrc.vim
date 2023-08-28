
" command breakdown: 
" 1. When this file becomes active in vim run the commands to the right of this command:
" -----> autocmd VimEnter *.git/COMMIT_EDITMSG
" 2. call IncrementEditText function

" placeholder command till if statement is added that creates the string if it does not exist
" autocmd VimEnter *.git/COMMIT_EDITMSG $r! date
" autocmd VimEnter *.git/COMMIT_EDITMSG /This commit has been edited/ | s/\d\+/\=(submatch(0)+1)/g

autocmd VimEnter *.git/COMMIT_EDITMSG call CreateOrIncrementLine()

function CreateOrIncrementLine()
  if search("This commit has been edited foo", "nw")
    echo "I am true"
    "call IncrementEditText()
  else 
    echo "I am false"
    "call IncrementEditText()
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
  /This commit has been edited/ | s/\d\+/\=(submatch(0)+1)/g
endfunction
