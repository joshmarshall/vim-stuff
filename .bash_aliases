source /usr/local/bin/virtualenvwrapper.sh
alias nt='clear && python `which nosetests` -x --rednose'
USER="$(whoami)@"
HOST="$(hostname)"
if [[ $USER == "jmarshall@" ]]; then
    # don't need to say who it is if its me. :)
    USER=""
fi;
if [[ $HOST == josh-* ]] || [[ $HOST == jm-* ]]; then
    # it's one of my systems, so no need to show hostname.
    HOST="⌨ "
fi;
export PS1="\[\033[32m\]$USER$HOST\[\033[01;34m\] \W\[\033[31m\]\$(__git_ps1)\[\033[00m\] ⚡\[\033[00m\] "
source ~/.bash_secure
