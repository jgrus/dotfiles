"General settings to make the editing windows look nicer
set hidden
set number
set ruler
syntax on 

"use tab to cycle between las and current buffer in normal mode
nnoremap <Tab> :b#<cr>

"Map leader to <, which is comfortable on the swedish keyboard
let mapleader="<"

"map <b to a simle buffer selecion screen
nnoremap <leader>b :ls<cr>:b<space>

"map <f to a netrw file chooser which opens the file in the current window, 
"while preserving the current buffer in alternate
let g:netrw_altfile=1
nnoremap <leader>f <Cmd>b#<cr><Cmd>Explore<cr>

"<t opens a terminal in the current window
nnoremap <leader>t <Cmd>terminal++curwin<cr>
