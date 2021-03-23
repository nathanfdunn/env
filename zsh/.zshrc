# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nathandunn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="muse2"
# ZSH_THEME="frontcube"
# "rkj" is cool
# muse almost perfect...

plugins=(git)

source $ZSH/oh-my-zsh.sh


##### BEGIN BASH_PROFILE IMPORT

# if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
#   . /opt/local/etc/profile.d/bash_completion.sh
# fi

# fpath=(~/.zsh $fpath)


# rm ~/.zcompdump
# autoload -U compinit && compinit
# zmodload -i zsh/complist

# Can't get this to work in ~/.inputrc
# (Apparently can't get this to work here either)
# bind '"\e[Z":menu-complete-backward'


# source /usr/local/etc/bash_completion.d/git-prompt.sh
# export PS1='\[\e[7m\]\w$(__git_ps1)\$\[\e[0m\] '
# echo 0 > ~/Desktop/current/directory/index.txt
# chesspiece() {
# 	dateHash=0x$(date +%F | md5)
	
# 	# pieces='♔♕♖♗♘♙♚♛♜♝♞♟'
# 	# pieces='♚♛♜♝♞♟'
# 	pieces='♟'

# 	# ind=$[$dateHash % ${#pieces}]

# 	# ind=$(cat ~/Desktop/current/directory/index.txt)
# 	# echo $(($ind + 1)) > ~/Desktop/current/directory/index.txt

# 	# echo ${pieces:$ind:1}
# 	echo pieces
# }
# export PS1='\[\e[7m\]\w$(__git_ps1)$(chesspiece) \[\e[0m\] '
# export PS1='\w$(__git_ps1)$(chesspiece)  '


# Enable git command completion
# source /usr/local/etc/bash_completion.d/git-completion.bash
# source /usr/local/etc/bash_completion.d/git-completion.zsh
# source /usr/local/etc/completion/git-completion.zsh

# # # Enable git command completion for my alias(es)
# complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g

# __git_complete gc _git_checkout
# __git_complete gb _git_branch
# __git_complete gl _git_log

# source /usr/local/etc/bash_completion.d/npm-completion.sh


# mkcd() {
# 	mkdir $*
# 	cd ${@: -1}
# }

# venv() {
# 	source ~/.virtualenvs/"$1"/bin/activate
# }

# newalias () {
# 	if [ -z "$2" ]; then
# 		echo alias $1="\"$(history -p !!)\"" >> ~/.bash_aliases
# 	else
# 		echo alias $1="\"${@:2}\"" >> ~/.bash_aliases
# 	fi
# 	rbp
# }

# newgo() {
# 	targetdir=${2:-$PWD}
# 	echo "alias $1=\"pushd ${targetdir/$HOME/~}\"" >> ~/.bash_locations
# 	rbp
# }

newcommand() {
	echo '#!/usr/bin/env bash' > ~/Commands/"$1"
	chmod +x ~/Commands/"$1"
}


# Heroku Deploy
herdep() {
	git acm "$1" && git push heroku master && heroku logs --tail
}


op () {
	if [[ $# -eq 0 ]]; then
		open .
	else
		open "$*"
	fi
}


testfunc(){
	if [[ "234" == "234" ]]; then
		echo 'good'
	fi
}

proj() {
	if [[ "$1" == "-l" ]]; then
		ls ~/Projects
		return
	fi
	if [[ -n "$2" ]]; then
		mkdir ~/Projects/"$1"
		git init ~/Projects/"$1"
		echo "# $1" > ~/Projects/"$1"/README.md
	fi
	pushd ~/Projects/"$1"
}

_proj_options() {
	local cur
	cur=$(awk '{print tolower($0)}' <<< ${COMP_WORDS[COMP_CWORD]})

	if [[ $COMP_CWORD -eq 1 ]]; then
		COMPREPLY=( $(compgen -W "$(ls ~/Projects | awk '{print tolower($0)}')" -- $cur) )
	fi
}
complete -F _proj_options proj


source ~/.django_bash_completion

source $ZDOTDIR/.path

source $ZDOTDIR/.aliases

source ~/Commands/_list_options

complete -F _list_options list