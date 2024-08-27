filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=4
set number
set relativenumber
colorscheme calmar256-dark
set laststatus=2
set path+=**
set wildmenu

" REMAPS

inoremap jk <Esc>
inoremap <F3> <Space>{<CR><CR>}<Up><Tab>
nnoremap <C-Down> <C-E>
nnoremap <C-Up> <C-Y>

let g:lsp = v:true
let g:lsc = v:false

source $HOME/.vim/lsp.vim
source $HOME/.vim/lsc.vim

