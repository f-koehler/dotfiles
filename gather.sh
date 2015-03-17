#!/bin/bash

# create folder structure
mkdir -p bin ghc git gtk/gtk-3.0 i3 msmtp mutt offlineimap profile systemd vim xorg 

# copy folder contents
cp -rf $HOME/.bin/* bin/
cp -rf $HOME/.config/systemd/user/*.service systemd/
cp -rf $HOME/.vim vim/

# copy single files
cp -f $HOME/.ghci ghc/
cp -f $HOME/.gitconfig git/
cp -f $HOME/.gtkrc-2.0 gtk/
cp -f $HOME/.config/gtk-3.0/settings.ini gtk/gtk-3.0/
cp -f $HOME/{.i3/config,.i3blocks.conf} i3/
cp -f $HOME/.msmtprc msmtp/
cp -f $HOME/.muttrc mutt/
cp -f $HOME/{.offlineimaprc,.offlineimap.py} offlineimap/
cp -f $HOME/.profile profile/
cp -f $HOME/.vimrc vim/
cp -f $HOME/{.XCompose,.Xmodmap,.xprofile,.Xresources,.Xresources-bright} xorg/
cp -f $HOME/.zshrc zsh/
