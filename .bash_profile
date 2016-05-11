alias a='cat ~/.bash_profile'
alias ls='ls -la'
alias sb='cd /Users/brendan/sandbox'
alias bp='vim ~/.bash_profile'
alias bp-reload='source ~/.bash_profile'
alias gp='git pull'
alias push='git push'
alias gaa='git add .'
alias gc="git commit -m'"
if [ -f `brew --prefix`/etc/bash_completion ]; then
	    . `brew --prefix`/etc/bash_completion
fi
source ~/.git-prompt.sh
source ~/git-flow-completion.bash
