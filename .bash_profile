#PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m\h\e[0m'; else echo '\e[31m\h\e[0m' ; fi\`:\$PWD\n\$ "
parse_git_branch() {
  MYPWD=`pwd`
  if [[ "$MYPWD" =~ "/Volumes/" ]]; then
      echo ""
  else
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
  fi
}
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
PS1='\[\033[00;33m\]\u\[\033[00;00m\]@\[\033[00;32m\]\h\[\033[00;35m\]\[\033[01;37m\]\w$(parse_git_branch)\[\033[00m\]\n\$ '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -laFh'
alias bp='vim ~/.bash_profile'
if [ -f ~/.bashrc ]; then
    alias bp-reload='source ~/.bashrc'
    echo 'reloading from .bashrc'
else
    alias bp-reload='source ~/.bash_profile'
    echo 'reloading from .bash_profile'
fi
alias gf='git fetch'
alias gaa='git add .'
alias gc="git commit -m\""
alias v='cd /vagrant'
alias gr='git remote --v'
alias gphd='echo Pushing Develop to Heroku-Dev; git push heroku-dev develop:master'
alias gphsd='echo Pushing Develop to Heroku-Stage; git push heroku-stage develop:master'
alias gphsm='echo Pushing Master to Heroku-Stage; git push heroku-stage master'
alias gpod='echo Pushing Develop to Origin; git push origin develop'
alias gpom='echo Pushing Master to Origin; git push origin master'
alias gs='git status'
	
export PATH=~/.composer/vendor/bin:$PATH
# shared shell bash history
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export VISUAL=vim
export EDITOR="$VISUAL"
