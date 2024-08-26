" Basic Settings
filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set nocompatible
set laststatus=2

" Make find search more QoL
set wildmenu
set path+=**

""" REMAPS
inoremap jk <Esc>

" Greeting message
augroup User
	au!
	autocmd VimEnter * {
		echohl Comment
		echo "Welcome back ! ~(^._.)"
		echohl None
	}
augroup END

