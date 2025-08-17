"General settings to make the editing windows look nicer
set hidden
set number relativenumber
set ruler
syntax on 
colorscheme desert

"use ö to toggle search highlights on and off
nnoremap <silent><expr> ö (v:hlsearch ? ':nohls' : ':set hls')."<cr>"

"use tab to cycle between las and current buffer in normal mode
nnoremap <Tab> :b#<cr>

"Map leader to <, which is comfortable on the swedish keyboard
let mapleader=" "

"map <b to a simle buffer selecion screen
nnoremap <leader>b :ls<cr>:b<space>

"map <f to a netrw file chooser which opens the file in the current window, 
"while preserving the current buffer in alternate
let g:netrw_altfile=1
nnoremap <leader>f <Cmd>b#<cr><Cmd>Explore<cr>

"<t opens a terminal in the current window and maps <Esc> to enter 
"normal mode. Configuration works on both vim and neovim
if has('nvim')
	nnoremap <leader>t <Cmd>terminal<cr>i
	tnoremap <Esc> <C-\><C-n>
endif

if !has('nvim')
	nnoremap <leader>t <Cmd>terminal ++curwin<cr>i
	tnoremap  <Esc> <C-w>N
endif

"Terminalj settings
augroup TerminalStuff
	au!
	"Turn off line numbers when in terminal mode
	if has('nvim')
		autocmd TermOpen * setlocal nonumber norelativenumber
	endif
	if !has('nvim')
		autocmd TerminalOpen * setlocal nonumber norelativenumber
	endif
augroup end

"Insert settings
augroup InsertStuff
	au!
	"Turn off line numbers when in terminal mode
	autocmd Insertenter,Focuslost * setlocal number norelativenumber
	autocmd InsertLeave * set number relativenumber
	"8 char wide tabs in makefiles
	autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
augroup end

"Automatic saving of views
augroup AutoView
	au!
        autocmd BufWinLeave *.* mkview
        autocmd BufWinEnter *.* silent loadview
augroup end

"Tabs are spaces and they are 4 spaces wide
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Remap some easily accesible keys on the swedish qwerty to more useful symbols.
"remap ≤ to the R pipe operator |>
"remap ± to the backslash \
abbreviate ≤ \|>
abbreviate ± \
