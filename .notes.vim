" double quotes make comments in vim.

" This commit has been edited 0 times

" autocmd VimEnter *.git/COMMIT_EDITMSG $r! date
" autocmd VimEnter *.git/COMMIT_EDITMSG %s/This commit has been edited 0 times/\u\1/g

" autocmd VimEnter *.git/COMMIT_EDITMSG %s/.*\(\<foo\>\).*/\1/
" autocmd VimEnter *.git/COMMIT_EDITMSG %s/.*\(\d\).*/&\1/

autocmd VimEnter *.git/COMMIT_EDITMSG /This commit has been edited/ | s/\d\+/\=(submatch(0)+1)/g
