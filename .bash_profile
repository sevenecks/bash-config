#PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m\h\e[0m'; else echo '\e[31m\h\e[0m' ; fi\`:\$PWD\n\$ "
parse_git_branch() {
  MYPWD=`pwd`
  if [[ "$MYPWD" =~ "/Volumes/" ]]; then
      echo ""
  else
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
  fi
}

PS1='\[\033[00;33m\]\u\[\033[00;00m\]@\[\033[00;32m\]\h\[\033[00;35m\]\[\033[01;37m\]\w$(parse_git_branch)\[\033[00m\]\n\$ '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias a='cat ~/.bash_profile'
alias ls='ls -la'
alias sb='cd /Users/brendan/sandbox'
alias bp='vim ~/.bash_profile'
if [ -f ~/.bashrc ]; then
    alias bp-reload='source ~/.bashrc'
    echo 'reloading from .bashrc'
else
    alias bp-reload='source ~/.bash_profile'
    echo 'reloading from .bash_profile'
fi
alias gp='git pull'
alias push='git push'
alias gaa='git add .'
alias gc="git commit -m\""
alias v='cd /vagrant'
