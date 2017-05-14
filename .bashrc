# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# avoid in history
export HISTCONTROL=ignoredups:erasedups  
# append instead of overwriting history on terminal exit
shopt -s histappend

txtblk="\e[0;90m" # Black
txtred="\e[0;91m" # Red
txtgrn="\e[0;32m" # Green
txtylw="\e[0;93m" # Yellow
txtblu="\e[0;34m" # Blue
txtpur="\e[0;95m" # Purple
txtcyn="\e[0;96m" # Cyan
txtwht="\e[0;97m" # White
txtrst="\e[0m"    # Text Reset

alias s=ssh
alias m=mutt
alias vi=vim
alias v=vim

alias g=git
alias gp='git pull'
alias gpush='git push'
alias b='./build'
alias t='./test'
alias c='./cover'

alias fork='hub fork && g pu && git co -b upstream-master --track origin/master'

alias hpr='hub pull-request'

. /usr/share/bash-completion/completions/git
__git_complete g __git_main

alias va='vagrant'

a () 
{
    ag $@ | fpp
}

add_to_path ()
{
    if [[ "$PATH" =~ (^|:)"${1}"(:|$) ]]
    then
        return 0
    fi
    export PATH=$PATH:${1}
}

shopt -s direxpand

export GOROOT=$HOME/go
add_to_path "$GOROOT/bin"
add_to_path "$HOME/rust/bin"
add_to_path "$HOME/git/depot_tools"
export PATH

git_branch() {
	git rev-parse 2>/dev/null && echo -en " $(git rev-parse --symbolic-full-name --abbrev-ref HEAD 2>/dev/null)"
}

go_path() {
	[ -n "${GOPATH}" ] && echo -en "${GOPATH} "
}

export TERMINAL="gnome-terminal"
export SUDO_PS1=": \[${txtred}\]\h\[${txtrst}\] \[${txtwht}\]\W\[${txtrst}\] #; "
export PS1=": \[${txtgrn}\]\h\[${txtrst}\] \[${txtcyn}\]\$(go_path)\[${txtrst}\]\[${txtwht}\]\W\[${txtrst}\]\[${txtylw}\]\$(git_branch)\[${txtrst}\] ; "

# save and reload history every time
export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
