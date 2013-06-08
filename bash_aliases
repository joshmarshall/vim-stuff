source /usr/local/bin/virtualenvwrapper.sh
alias nt='clear && python `which nosetests` -x --rednose'
alias flex='~/bin/flex/bin/mxmlc'
export MXMLC_PATH='~/bin/flex/bin/mxmlc'
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

# secret environment variables, etc
if [ -a ~/.bash_secure ]; then
    source ~/.bash_secure
fi

# machine-specific setup (xrandr, etc.)
if [ -a ~/.bash_local ]; then
    source ~/.bash_local
fi
