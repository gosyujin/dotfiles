#!/bin/bash

FROM=$HOME/github/dotfiles
/bin/ln -siv $FROM/.bashrc    $HOME
/bin/ln -siv $FROM/.gitconfig $HOME
/bin/ln -siv $FROM/.vimrc     $HOME
