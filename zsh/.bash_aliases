alias rsakeygen='ssh-keygen -t rsa -b 4096 -C "nathanfdunn@gmail.com"'

alias run='python manage.py runserver 3000'

alias sli='"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" -n'
alias slim='"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"'
alias chro='open -a "Google Chrome"'
alias ff='open -a Firefox'

alias showHidden='defaults write com.apple.Finder AppleShowAllFiles YES; killall Finder'
alias hideHidden='defaults write com.apple.Finder AppleShowAllFiles NO; killall Finder'

alias mem='python ~/Projects/Memory_Trainer/memory_trainer.py'

# alias chess='pushd ~/Programming/Unity/Chess_Rubiks_5/Assets/Infrastructure'
# alias chess2='pushd ~/Programming/Unity/Chess_Rubiks_5_1/Assets'
alias desk='pushd ~/Desktop'


alias py="python3"
alias py2="python2"

alias g='git'
alias gc='git checkout'
alias gs='git status'
alias gb='git branch'
alias gr='git remote'
# gr () {
# 	if [[ $# -eq 0 ]]; then
# 		git remote -v
# 	else
# 		git remote $*
# 	fi
# }
alias gl='git log'
alias gd='git diff'
alias gacm='git acm'
alias graph="git log --graph --pretty='%h %<(10,trunc)%an   %<(30,trunc)%s'"

# alias rbp="source ~/.bash_profile"
# alias ebp='sli ~/.bash_profile'

# Reload zsh profile
alias rzp="source ~/.zshrc"
alias ezp="sli ~/.zshrc"

# Edit pico8 config
alias epc='sli /Users/nathandunn/Library/Application\ Support/pico-8/config.txt'
alias gpom="git push origin master "
alias sshdoinit="pushd ~/.ssh && ssh-add digitalocean_rsa && popd"
alias envact='source "$(pipenv --venv)"/bin/activate'
alias backupmc='scp -r ubuntu@ec2-18-222-231-165.us-east-2.compute.amazonaws.com:~/minecraft/world ~/mcbackups/fieldcraft_$(date -u +"%Y-%m-%d_%H.%M.%SZ").bak'
# alias backupmc='scp -r nathanfdunn@nathanfdunn.com:~/minecraft/nathanandhayley100years ~/mcbackups/nathanandhayley100years$(date -u +"%Y-%m-%d_%H.%M.%SZ").bak'
# restoremc () {
# 	scp -r ./"$1" nathanfdunn@nathanfdunn.com:~/minecraft/nathanandhayley100years/
# }

# restore backup:
# scp -r /Users/nathandunn/Library/Application\ Support/minecraftOld/saves/nathanandhayley100years2017-08-01T00\:39\:18Z.bak nathanfdunn@nathanfdunn.com:~/minecraft/nathanandhayley100years/
# scp -r /Users/nathandunn/Library/Application\ Support/minecraftOld/saves/nathanandhayley100years2017-08-01T00\:39\:18Z.bak/playerdata nathanfdunn@nathanfdunn.com:~/minecraft/nathanandhayley100years/playerdata
alias pi="py3 -i"
alias tfenvact="source ~/Projects/tensorflowtest/tftestenv/bin/activate"
alias chessql="psql "dbname='fbchessbottest' user='nathandunn' host='localhost' password=''""
alias gocb="proj fbchessbot  && envact"
# alias fbchessbotsql="proj fbchessbot && psql $(heroku config:get DATABASE_URL)"

alias sli.="sli ."
alias runserv="python manage.py runserver"

alias hype="cargo run --bin client --release"

# sudo spctl --master-disable
# sudo spctl --master-enablealias cod="cod"
alias cod="/Applications/VSCodium.app/Contents/MacOS/Electron"

alias list="~/Commands/list"

alias p8export='/Users/nathandunn/Projects/trijam-automation/venv/bin/python /Users/nathandunn/Projects/trijam-automation/run.py'