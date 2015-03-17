#!/bin/bash

# create folder structure
mkdir -p $HOME/{.bin,.config/gtk-3.0,.i3,.vim}

# copy folder contents
cp -rf bin/* $HOME/.bin
cp -rf vim/.vim $HOME
cp -r  xorg/.X* xorg/.x* $HOME

# copy single files
cp -f ghc/.ghci $HOME
cp -f git/.gitconfig $HOME
cp -f gtk/.gtkrc-2.0 $HOME
cp -f gtk/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/
cp -f i3/config $HOME/.i3/
cp -f i3/.i3blocks.conf $HOME/
cp -f msmtp/.msmtprc $HOME
cp -f mutt/.muttrc $HOME
cp -f offlineimap/{.offlineimaprc,.offlineimap.py} $HOME
cp -f profile/.profile $HOME
cp -f vim/.vimrc $HOME

# create symlinks
ln -sf $HOME/.vimrc $HOME/.nvimrc
ln -sf $HOME/.vim $HOME/.nvim
