#!/bin/bash

LN=/bin/ln
FROM=$HOME/github/dotfiles
$LN -sfv $FROM/.bashrc    $HOME
$LN -sfv $FROM/.gitconfig $HOME
$LN -sfv $FROM/.vimrc     $HOME
