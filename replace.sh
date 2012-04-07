#!/bin/bash

LN=/bin/ln
FROM=$HOME/github/dotfiles
$LN -siv $FROM/.bashrc    $HOME
$LN -siv $FROM/.gitconfig $HOME
$LN -siv $FROM/.vimrc     $HOME
