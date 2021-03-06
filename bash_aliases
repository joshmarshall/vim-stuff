# machine-specific setup (xrandr, etc.)
if [ -a $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi

if hash brew 2>/dev/null; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi


set bell-style visible


# don't like __pycache__ files all over the place
export PYTHONDONTWRITEBYTECODE=nope


if [ -d $HOME/bin/flex/bin ]; then
    alias flex='$HOME/bin/flex/bin/mxmlc'
    export MXMLC_PATH='$HOME/bin/flex/bin/mxmlc'
fi

if [ -d $HOME/libs/go ]; then
    export GOPATH=$HOME/libs/go
    export PATH="${PATH}:~/libs/go/bin"
fi

if [ -d $HOME/bin ]; then
    export PATH="${PATH}:$HOME/bin"
fi

if [ -d $HOME/.local/bin ]; then
    export PATH="${PATH}:$HOME/.local/bin"
fi

if [ -d $HOME/.cabal/bin ]; then
    export PATH="${PATH}:$HOME/.cabal/bin"
fi

if [ -d $HOME/.elba/bin ]; then
    export PATH="${PATH}:$HOME/.elba/bin"
fi

if [ -f $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d $HOME/bin/swift/usr/bin ]; then
    export PATH="${PATH}:$HOME/bin/swift/usr/bin"
fi

if [ -d $HOME/.racket/$RACKET_VERSION/bin ]; then
    export PATH="${PATH}:$HOME/.racket/$RACKET_VERSION/bin"
fi

if [ -d $HOME/bin/flutter/bin ]; then
    export PATH="${PATH}:$HOME/bin/flutter/bin"
fi

if [ -d /usr/local/share/npm/bin ]; then
    export PATH="${PATH}:/usr/local/share/npm/bin"
fi

if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -d "$HOME/.yarn/bin" ]; then
    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

if [ -d $HOME/Android/Sdk ]; then
    export ANDROID_HOME="$HOME/Android/Sdk"
    export PATH="${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"
fi

if [ -d $HOME/.idris2/bin ]; then
    export IDRIS2_PATH="${HOME}/.idris2"
    export PATH="${PATH}:${IDRIS2_PATH}/bin"
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

# secret environment variables, etc
if [ -a $HOME/.bash_secure ]; then
    source $HOME/.bash_secure
fi

if [ -a $HOME/.bash_platform ]; then
    source $HOME/.bash_platform
fi

if [ -d $HOME/.pyenv/bin ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi

    if [ -d $HOME/.pyenv/plugins/pyenv-virtualenv/shims ]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# added by Nix installer
if [ -e /home/jmarshall/.nix-profile/etc/profile.d/nix.sh ]; then
    . /home/jmarshall/.nix-profile/etc/profile.d/nix.sh;
fi

# added by travis gem
[ -f /home/jmarshall/.travis/travis.sh ] && source /home/jmarshall/.travis/travis.sh

set +x

# Because Node / NPM...
export PATH="./node_modules/.bin:${PATH}"

if [ which -a docker ]; then
    alias docker-ps="docker ps -q | xargs docker inspect --format '{{ .Config.Image }} - {{ .Name }} - {{ .NetworkSettings.IPAddress }}'"
fi
