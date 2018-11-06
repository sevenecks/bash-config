#PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m\h\e[0m'; else echo '\e[31m\h\e[0m' ; fi\`:\$PWD\n\$ "
parse_git_branch() {
  MYPWD=`pwd`
  if [[ "$MYPWD" =~ "/Volumes/" ]]; then
      echo ""
  else
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
  fi
}
if hash gdate 2>/dev/null; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
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

#START COLORS
RESTORE='\033[0m'

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'


@color() {
    #need to set $1 arg to a variable so we can use indirect/reference variables
    #http://mywiki.wooledge.org/BashFAQ/006#Indirection
    color_name=$1
    echo -e "${!color_name}$2$RESTORE"
}
#END COOR
# SINDOME STYLE GREP
@grep() {
    @color RED "Grepping current dir recursively for $1"
    grep -R "$1" .
    @color RED "Grep complete."
}
# END GREP
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
