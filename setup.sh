DIR=`pwd`

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

link "$DIR/vimrc" ~/.vimrc
link "$DIR/vimrc" ~/.vimrc
link "$DIR/vim" ~/.vim
link "$DIR/.bash_aliases" ~/.bash_aliases
link "$DIR/xmonad" ~/.xmonad
link "$DIR/xmobarrc" ~/.xmobarrc
link "$DIR/background.jpg" ~/.background.jpg

distroid=`lsb_release -i`
distro=`expr substr "$distroid" 17 6`

if [[ $distro == "Ubuntu" ]]; then
  echo "Installing Ubuntu packages..."
  run sudo apt-get update
  run sudo apt-get install -y build-essential python-setuptools
  run sudo apt-get install -y xmonad xmobar suckless-tools gmrun xloadimage > /dev/null
  run sudo easy_install pip
fi

touch ~/.bash_secure
chmod 700 ~/.bash_secure

echo -n "Setup terminal colors? (YES to continue) "
read confirmation
if [[ $confirmation == "" ]]; then
  confirmation="YES"
fi
confirmation=$(echo $confirmation | tr '[:lower:]' '[:upper:]')
if [[ $confirmation == YES ]]; then
  ./gnome-terminal-zenburn.sh
fi
