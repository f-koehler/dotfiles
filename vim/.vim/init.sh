#!/bin/bash

if [ ! -d bundle ]; then
    mkdir bundle
fi

cd bundle

git clone https://github.com/gmarik/Vundle.vim.git vundle
