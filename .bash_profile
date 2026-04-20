export http_proxy="http://10.98.2.243:3128"
export https_proxy="http://10.98.2.243:3128"
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

if [ -e "${HOME}/.bash_format" ]; then
    source "${HOME}/.bash_format"
fi

if [ -e "${HOME}/.bash_utils" ]; then
    source "${HOME}/.bash_utils"
fi

export PS1="${BOLD}${GREEN}\u${WHITE}@${BLUE}\h${YELLOW} \W${MAGENTA}\$(_git_branch_info)${RESET} \$ "
