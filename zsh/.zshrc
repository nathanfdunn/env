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

source $ZDOTDIR/.env

source $ZDOTDIR/.path

source $ZDOTDIR/.aliases

source $COMMANDDIR/_list_options

complete -F _list_options list