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

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"







##### BEGIN BASH_PROFILE IMPORT

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

fpath=(~/.zsh $fpath)


# rm ~/.zcompdump
# autoload -U compinit && compinit
# zmodload -i zsh/complist

# Can't get this to work in ~/.inputrc
# (Apparently can't get this to work here either)
# bind '"\e[Z":menu-complete-backward'
source $ZDOTDIR/.bash_aliases
source $ZDOTDIR/.bash_locations

source ~/Commands/_list_options

complete -F _list_options list

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

# addpath() {
# 	echo export PATH=${1:-$PWD}:'$PATH' >> ~/.bash_profile
# 	source ~/.bash_profile
# }

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

# TODO! Does not work!
# # My custom commands
export PATH="~/Commands:$PATH"

# # Postgres
# export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"

# # MacPorts Installer addition on 2014-11-21_at_23:05:43: adding an appropriate PATH variable for use with MacPorts.
# # export PATH="/opt/local/bin:/opt/local/sbin:$PATH"		# screw macports
# # Finished adapting your PATH environment variable for use with MacPorts.

# export PATH="/usr/local/lib:$PATH"

# [ -s "~/.dnx/dnvm/dnvm.sh" ] && . "~/.dnx/dnvm/dnvm.sh" # Load dnvm

# # export NVM_DIR="/Users/nathandunn/.nvm"
# # [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm





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

export PATH=/Users/nathandunn/.local/bin:$PATH

# hs() {
# 	if [ -z "$1" ]; then
# 		ghci
# 	else
# 		filename=`echo $1 | sed 's/\(.*\).../\1/i'`
# 		echo $filename
# 		ghc -o temp "$filename.hs"
# 		./temp
# 		rm temp
# 		rm "$filename.hi"
# 		rm "$filename.o"
# 	fi
# }
# newhs() {
# 	echo 'main = putStrLn "asdf"' > hello.hs
# }

# # [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# alias sshdo="ssh nathanfdunn@138.197.26.252"


# export TF_CPP_MIN_LOG_LEVEL=2


source ~/.django_bash_completion

# export PIPENV_VENV_IN_PROJECT=1
export PATH="/usr/local/opt/ruby/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:$HOME/Library/Application Support/itch/apps/butler"

# export PATH="/Users/nathandunn/.pathoverride:$PATH"
