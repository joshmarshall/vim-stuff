DIR=`pwd`

sudo echo "Running installation..."

if !hash brew 2>/dev/null; then
    echo "Missing brew!"
    exit 1
fi

function link {
  destination=$2
  source=$1
  test -e $destination
  if [[ $? == "0" ]]; then
    echo "FILE $destination already exists -- skipping link."
  else
    echo "LINKING $destination..."
    run ln -s "$source" "$destination"
  fi
}

function run {
  log_output=`$@`
  if [[ $? != 0 ]]; then
    echo "COULD NOT RUN '$@'"
    if [[ $log_output != "" ]]; then
      echo $log_output
    fi
    exit 1
  fi
}

function confirm {
  echo -n $1
  read confirmation
  default=$2
  if [[ $confirmation == "" ]]; then
    confirmation=$default
  fi
  confirmation=$(echo $confirmation | tr '[:lower:]' '[:upper:]')
  if [[ $confirmation == YES ]]; then
    return 1
  fi
  return 0
}

link "$DIR/vimrc" ~/.vimrc
link "$DIR/vim" ~/.vim
link "$DIR/bash_aliases" ~/.bash_profile
link "$DIR/ghci" ~/.ghci

touch ~/.bash_secure
chmod 700 ~/.bash_secure

confirm "Install brew packages (default YES): " "YES"
if [[ $? == 1 ]]; then
    echo "Installing Brew packages..."
    run brew install git
    run brew install bash-completion
fi
