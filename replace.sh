#!/bin/bash

FROM=$HOME/github/dotfiles
OPTIONS=-fsv

case $1 in
  -n) echo no-interactive ;;
  * ) OPTIONS=${OPTIONS}i ;;
esac

/bin/ln ${OPTIONS} $FROM/.bashrc    $HOME
/bin/ln ${OPTIONS} $FROM/.gitconfig $HOME
/bin/ln ${OPTIONS} $FROM/.vimrc     $HOME
/bin/ln ${OPTIONS} $FROM/.tmux.conf $HOME
mkdir -p $HOME .tmux

# Karabiner
/bin/ln ${OPTIONS} $FROM/karabiner_private.xml ~/Library/Application\ Support/Karabiner/private.xml

if [ -e ~/.vim/vundle ]; then
  echo "git clone vundle"
  git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git
  echo "and :VundleInstall"
fi
