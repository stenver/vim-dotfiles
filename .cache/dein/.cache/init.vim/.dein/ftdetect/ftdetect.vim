" Detect vimshell rc file.
autocmd BufNewFile,BufRead *.vimsh,.vimshrc,vimshrc set filetype=vimshrc
autocmd BufNewFile,BufRead *.skim set filetype=skim
autocmd BufReadPost *.fugitiveblame setfiletype fugitiveblame
call polyglot#init#init()
