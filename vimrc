filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=4
set number
set relativenumber

inoremap jj <Esc>

nnoremap <C-E> :Explore! .<CR>

packadd lsp

" Rust language server
call LspAddServer([#{
	\    name: 'rustlang',
	\    filetype: ['rust'],
	\    path: '/usr/bin/rust-analyzer',
	\    args: [],
	\    syncInit: v:true
	\  }])

let g:apl_prefix_key='°'

function RustEvent()
	if &filetype == "rust"
		colorscheme blue
	else
		colorscheme default
	endif
endfunction

autocmd BufWinEnter * call RustEvent()

