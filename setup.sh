DIR=`pwd`

ln -s "$DIR/vimrc" ~/.vimrc
ln -s "$DIR/vim" ~/.vim
ln -s "$DIR/.bash_aliases" ~/.bash_aliases
ln -s "$DIR/xmonad" ~/.xmonad
ln -s "$DIR/xmobarrc" ~/.xmobarrc
touch ~/.bash_secure
chmod 700 ~/.bash_secure
./gnome-terminal-zenburn.sh
