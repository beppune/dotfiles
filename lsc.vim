
echohl Debug
if !g:lsc
	finish
endif

if finddir("lsc", getenv('HOME') .  '/.vim/pack/**') ==? ""
	echo "NO LSP found"
	finish
endif

"" LANGUAGE SERVERS
packadd lsc

let g:lsc_server_commands = {'rust': 'rust-analyzer'}
let g:lsc_auto_map = v:true

echohl None
