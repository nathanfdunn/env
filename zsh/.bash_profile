# Can't get this to work in ~/.inputrc
# (Apparently can't get this to work here either)
# bind '"\e[Z":menu-complete-backward'
source ~/.bash_aliases
source ~/.bash_locations


source /usr/local/etc/bash_completion.d/git-prompt.sh
# export PS1='\[\e[7m\]\w$(__git_ps1)\$\[\e[0m\] '
# echo 0 > ~/Desktop/current/directory/index.txt
chesspiece() {
	dateHash=0x$(date +%F | md5)
	
	# pieces='♔♕♖♗♘♙♚♛♜♝♞♟'
	# pieces='♚♛♜♝♞♟'
	pieces='♟'

	ind=$[$dateHash % ${#pieces}]

	# ind=$(cat ~/Desktop/current/directory/index.txt)
	# echo $(($ind + 1)) > ~/Desktop/current/directory/index.txt

	echo ${pieces:$ind:1}
}
export PS1='\[\e[7m\]\w$(__git_ps1)$(chesspiece) \[\e[0m\] '
# export PS1='\w$(__git_ps1)$(chesspiece)  '

# Enable git command completion
source /usr/local/etc/bash_completion.d/git-completion.bash
# Enable git command completion for my alias(es)
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null || complete -o default -o nospace -F _git g

__git_complete gc _git_checkout
__git_complete gb _git_branch
__git_complete gl _git_log

# source /usr/local/etc/bash_completion.d/npm-completion.sh


mkcd() {
	mkdir $*
	cd ${@: -1}
}

venv() {
	source ~/.virtualenvs/"$1"/bin/activate
}

newalias () {
	if [ -z "$2" ]; then
		echo alias $1="\"$(history -p !!)\"" >> ~/.bash_aliases
	else
		echo alias $1="\"${@:2}\"" >> ~/.bash_aliases
	fi
	rbp
}

newgo() {
	targetdir=${2:-$PWD}
	echo "alias $1=\"pushd ${targetdir/$HOME/~}\"" >> ~/.bash_locations
	rbp
}

newcommand() {
	echo '#!/usr/bin/env bash' > ~/Commands/"$1"
	chmod +x ~/Commands/"$1"
}

addpath() {
	echo export PATH=${1:-$PWD}:'$PATH' >> ~/.bash_profile
	source ~/.bash_profile
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

# My custom commands
export PATH="~/Commands:$PATH"

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"

# MacPorts Installer addition on 2014-11-21_at_23:05:43: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"		# screw macports
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH="/usr/local/lib:$PATH"

[ -s "~/.dnx/dnvm/dnvm.sh" ] && . "~/.dnx/dnvm/dnvm.sh" # Load dnvm

# export NVM_DIR="/Users/nathandunn/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm



source ~/Commands/_list_options

complete -F _list_options list

proj() {
	if [ "$1" == "-l" ]; then
		ls ~/Projects
		return
	fi
	if [ -n "$2" ]; then
		mkdir ~/Projects/"$1"
		git init ~/Projects/"$1"
		echo "# $1" > ~/Projects/"$1"/README.md
	fi
	pushd ~/Projects/"$1"
}

_proj_options() {
	local cur
	cur=$(awk '{print tolower($0)}' <<< ${COMP_WORDS[COMP_CWORD]})

	if [ $COMP_CWORD -eq 1 ]; then
		COMPREPLY=( $(compgen -W "$(ls ~/Projects | awk '{print tolower($0)}')" -- $cur) )
	fi
}
complete -F _proj_options proj

export PATH=/Users/nathandunn/.local/bin:$PATH

hs() {
	if [ -z "$1" ]; then
		ghci
	else
		filename=`echo $1 | sed 's/\(.*\).../\1/i'`
		echo $filename
		ghc -o temp "$filename.hs"
		./temp
		rm temp
		rm "$filename.hi"
		rm "$filename.o"
	fi
}
newhs() {
	echo 'main = putStrLn "asdf"' > hello.hs
}

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


alias sshdo="ssh nathanfdunn@138.197.26.252"


export TF_CPP_MIN_LOG_LEVEL=2


source ~/.django_bash_completion

export PIPENV_VENV_IN_PROJECT=1
export PATH="/usr/local/opt/ruby/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Users/nathandunn/.pathoverride:$PATH"