#!/bin/bash

cp -r ./nvim ~/.config

sudo apt update

sudo apt install -y \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ \
    pkg-config unzip git

if ! [ -d $HOME/neovim ]; then
    git clone https://github.com/neovim/neovim ~/build/neovim
    cd ~/build/neovim
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
    sudo make install
fi


if ! [ -d $HOME/.local.share/nvim/site/autoload ]
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
        --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi


