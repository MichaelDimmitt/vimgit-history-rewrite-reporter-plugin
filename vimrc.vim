autocmd VimEnter *.git/COMMIT_EDITMSG /This commit has been edited/ | s/\d\+/\=(submatch(0)+1)/g
" command breakdown: 
" 1. When this file becomes active in vim run the commands to the right of this command:
" -----> autocmd VimEnter *.git/COMMIT_EDITMSG
" 2. Move the cursor to the line that has the following text "This commit has been edited"
" -----> /This commit has been edited/
" 3. If the first command succeds run the second command 
" ----->  | 
" 4. given the current cursors line replace the current number found with itself + 1.
" -----> s/\d\+/\=(submatch(0)+1)/g 
