R=`pwd`

sudo echo "Running installation..."

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
link "$DIR/vimrc" ~/.vimrc
link "$DIR/vim" ~/.vim
link "$DIR/bash_aliases" ~/.bash_aliases
link "$DIR/tmux.conf" ~/.tmux.conf

mkdir -p $HOME/bin
mkdir -p $HOME/libs/go

distroid=`lsb_release -i`
distro=`expr substr "$distroid" 17 6`

if [[ $distro == "Ubuntu" ]]; then
  link "$DIR/xmonad" ~/.xmonad
  link "$DIR/xmobarrc" ~/.xmobarrc
  link "$DIR/background.jpg" ~/.background.jpg

  confirm "Install system packages? (default YES): " "YES"
  if [[ $? == 1 ]]; then
    echo "Installing Ubuntu packages..."
    run sudo apt-get update
    run sudo apt-get install -y build-essential python-setuptools
    run sudo apt-get install -y xmonad xmobar suckless-tools gmrun xloadimage > /dev/null
    run sudo apt-get install -y ttf-droid
    run sudo easy_install pip
  fi
fi

touch ~/.bash_secure
chmod 700 ~/.bash_secure

confirm "Setup terminal colors? (default YES): " "YES"
if [[ $? == 1 ]]; then
  ./gnome-terminal-zenburn.sh
fi
