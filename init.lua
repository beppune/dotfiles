vim.cmd([[

set tabstop=4
set shiftwidth=4
set number
set relativenumber

inoremap jj <Esc>
inoremap <C-o> <Esc>o}<Esc>O
inoremap <C-s> <Esc>:w<Enter>i

nnoremap <C-q> <Esc>:q!<Enter>
nnoremap <C-h> <Esc>:noh<Enter>

augroup Folds
	au!
	autocmd FileType c,rust set foldmethod=indent
	autocmd FileType c,rust set foldcolumn=1
augroup END

]])
