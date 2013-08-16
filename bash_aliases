if hash brew 2>/dev/null; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

alias nt='clear && python `which nosetests` -x --rednose'
alias flex='~/bin/flex/bin/mxmlc'
export MXMLC_PATH='~/bin/flex/bin/mxmlc'

if [ -d ~/.cabal/bin ]; then
    export PATH="${PATH}:~/.cabal/bin"
fi

if [ -d ~/bin ]; then
    export PATH="${PATH}:~/bin"
fi


# terminal prompt stuff
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
export PS1="\[\033[32m\]$USER$HOST\[\033[01;34m\] \W\[\033[31m\]\$(__git_ps1)\[\033[00m\] ✪ \[\033[00m\]"



# virtualenv stuff...
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
    check_virtualenv() {
        if [ -e .venv ]; then
            workon `cat .venv`
        elif [ "`echo $VIRTUAL_ENV`" != "" ]; then
            deactivate
        fi
    }

    venv_cd() {
        builtin cd "$@" && check_virtualenv
    }

    alias cd=venv_cd
    check_virtualenv
fi


# secret environment variables, etc
if [ -a ~/.bash_secure ]; then
    source ~/.bash_secure
fi

# machine-specific setup (xrandr, etc.)
if [ -a ~/.bash_local ]; then
    source ~/.bash_local
fi
