#!/bin/bash

FROM=$HOME/github/dotfiles
/bin/ln -fsiv $FROM/.bashrc    $HOME
/bin/ln -fsiv $FROM/.gitconfig $HOME
/bin/ln -fsiv $FROM/.vimrc     $HOME
