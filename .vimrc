"General settings to make the editing windows look nicer
set hidden
set number relativenumber
set ruler
syntax on 
colorscheme desert
hi! Normal guibg=NONE ctermbg=NONE
hi! EndOfBuffer guibg=NONE ctermbg=NONE
set cursorline
hi! CursorLine guibg=NONE ctermbg=NONE
hi! CursorLine gui=underline cterm=underline

"use ö/; to toggle search highlights on and off
nnoremap <silent><expr> <leader>ö (v:hlsearch ? ':nohls' : ':set hls')."<cr>"
nnoremap <silent><expr> <leader>; (v:hlsearch ? ':nohls' : ':set hls')."<cr>"

"use tab to cycle between las and current buffer in normal mode
nnoremap <Tab> :b#<cr>

"Map leader to <space>, which is comfortable on the swedish keyboard
let mapleader=" "

"map <leader>b to a simle buffer selecion screen
nnoremap <leader>b :ls<cr>:b<space>

"map <leader>f to a netrw file chooser which opens the file in the current window, 
"while preserving the current buffer in alternate
let g:netrw_altfile=1
nnoremap <leader>f <Cmd>b#<cr><Cmd>Explore<cr>

"Automatic saving of views
augroup AutoView
	au!
        autocmd BufWinLeave *.* mkview
        autocmd BufWinEnter *.* silent loadview
augroup end

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
    "<leader>t opens a terminal in the current window and maps <Esc> to enter 
    "normal mode. Configuration works on both vim and neovim
    if has('nvim')
        nnoremap <leader>t <Cmd>terminal<cr>i
        tnoremap <Esc> <C-\><C-n>
    endif

    if !has('nvim')
        nnoremap <leader>t <Cmd>terminal ++curwin<cr>i
        tnoremap  <Esc> <C-w>N
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

"Latex abbreviations
augroup latex_abbrevs
    autocmd!
    autocmd FileType plaintex,latex,tex iab bgn \begin{%%}<CR>\end{%%}<C-o>O<C-o>:-1,+1s/%%/
    autocmd FileType plaintex,latex,tex iab ** \item
    autocmd FileType plaintex,latex,tex iab cbx \colorbox{Goldenrod}{}<C-o>i
    autocmd FileType plaintex,latex,tex iab ref \colorbox{Goldenrod}{(REF?)}
augroup end
