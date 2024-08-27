
echohl Debug
if !g:lsp
	finish
endif

if finddir("lsp", getenv('HOME') .  '/.vim/pack/**') ==? ""
	echo "NO LSP found"
	finish
endif

"" LANGUAGE SERVERS
packadd lsp

call LspOptionsSet(#{ 
			\ noNewlineInCompletion: v:true,
			\ outlineOnRight: v:true,
			\ outlineWinSize: 45
			\ })

" Rust
call LspAddServer([#{
			\    name: 'rustlang',
			\    filetype: ['rust'],
			\    path: '/usr/bin/rust-analyzer',
			\    args: [],
			\    syncInit: v:true
			\  }])

" Reset echohl
echohl None
