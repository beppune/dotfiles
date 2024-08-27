filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=4
set number
set relativenumber
colorscheme fu
set laststatus=2
set path+=**
set wildmenu

" REMAPS

inoremap jk <Esc>
inoremap <F3> <Space>{<CR><CR>}<Up><Tab>

let g:lsp = v:true
source $HOME/.vim/lsp.vim

