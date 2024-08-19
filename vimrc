filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=4
set number
set relativenumber


""" REMAPS

inoremap jj <Esc>
nnoremap <C-E> :Explore! .<CR>


""" LANGUAGE SERVERS
packadd lsp

""" Rust
call LspAddServer([#{
	\    name: 'rustlang',
	\    filetype: ['rust'],
	\    path: '/usr/bin/rust-analyzer',
	\    args: [],
	\    syncInit: v:true
	\  }])



"""" FUNCTIONS

"""" RustEvent
"""" set color scheme for "ide mode"
function RustEvent()
	if &filetype == "rust"
		colorscheme fu
	else
		colorscheme ron
	endif
endfunction


""" AUTOCOMMANDS
augroup Rust
	autocmd BufWinEnter * call RustEvent()
augroup END

