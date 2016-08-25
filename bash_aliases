if [[ ! -z $VIRTUAL_ENV ]]; then
  deactivate
fi

if hash brew 2>/dev/null; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# don't like __pycache__ files all over the place
export PYTHONDONTWRITEBYTECODE=nope

alias flex='~/bin/flex/bin/mxmlc'
export MXMLC_PATH='~/bin/flex/bin/mxmlc'
export GOPATH=$HOME/libs/go

alias ansible='~/bin/venvs/ansible/bin/ansible'
alias ansible-playbook='~/bin/venvs/ansible/bin/ansible-playbook'

if [ -d ~/.cabal/bin ]; then
    export PATH="${PATH}:~/.cabal/bin"
fi

if [ -d ~/bin ]; then
    export PATH="${PATH}:~/bin"
fi

if [ -d ~/.racket ]; then
    export PATH="${PATH}:~/.racket/bin"
fi

if [ -d /usr/local/share/npm/bin ]; then
    export PATH="${PATH}:/usr/local/share/npm/bin"
fi

# terminal prompt stuff
export GIT_PS1_SHOWUPSTREAM="auto"
USER="$(whoami)@"
HOST="$(hostname)"
if [[ $USER == "jmarshall@" ]]; then
    # don't need to say who it is if its me. :)
    USER=""
fi;

shopt -s nocasematch
if [[ $HOST == josh-* ]] || [[ $HOST == jm-* ]] || [[ $HOST == jmarshall-* ]]; then
    # it's one of my systems, so no need to show hostname.
    HOST="[] "
fi;
shopt -u nocasematch

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\033[0;32m\]$USER$HOST\[\033[1;34m\]\W\[\033[0;31m\]\$(__git_ps1)\[\033[0m\] > \[\033[0m\]"

# virtualenv stuff...
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi


# secret environment variables, etc
if [ -a ~/.bash_secure ]; then
    source ~/.bash_secure
fi

if [ -a ~/.bash_platform ]; then
    source ~/.bash_platform
fi

# machine-specific setup (xrandr, etc.)
if [ -a ~/.bash_local ]; then
    source ~/.bash_local
fi

check_virtualenv() {
    if [[ ! -z $VIRTUAL_ENV ]]; then
      deactivate
    fi
    if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
        if [ -e .venv ]; then
            workon `cat .venv`
        fi
    fi
}

check_variables() {
    local env="$PWD/.env"
    if [ -e "$env" ]; then
        # TODO: make this smarter... unset, etc.
        source "$env"
        export CURRENT_ENV="$env"
    fi
}

check_cd() {
    builtin cd "$@" && check_variables && check_virtualenv
}

alias cd=check_cd
check_variables
check_virtualenv

# Because Node / NPM...
export PATH="./node_modules/.bin:${PATH}"
