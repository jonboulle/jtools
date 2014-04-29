# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


txtblk="\e[0;90m" # Black
txtred="\e[0;91m" # Red
txtgrn="\e[0;32m" # Green
txtylw="\e[0;93m" # Yellow
txtblu="\e[0;34m" # Blue
txtpur="\e[0;95m" # Purple
txtcyn="\e[0;96m" # Cyan
txtwht="\e[0;97m" # White
txtrst="\e[0m"    # Text Reset

alias vi=vim
alias v=vim

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
add_to_path "$HOME/gsutil"
add_to_path "$GOROOT/bin"
add_to_path "$HOME/git/depot_tools"
export PATH

git_branch() {
	git rev-parse 2>/dev/null && echo -en " $(git rev-parse --symbolic-full-name --abbrev-ref HEAD 2>/dev/null)"
}

export SUDO_PS1=": \[${txtred}\]\h\[${txtrst}\] \[${txtwht}\]\W\[${txtrst}\] #; "
export PS1=": \[${txtgrn}\]\h\[${txtrst}\] \[${txtwht}\]\W\[${txtrst}\]\[${txtylw}\]\$(git_branch)\[${txtrst}\] ; "
