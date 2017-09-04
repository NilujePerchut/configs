#!/bin/bash
#
# This script is written to be launched into the configs
# directory.
#
# It will install all the configuration using links
#

function gvim_old_cfg_install {
	#remove any previous configuration
	rm -rf $HOME/.vim
	rm -f $HOME/.vimrc
	#create the new links
	ln -s $HOME/configs/.vim $HOME/.vim
	ln -s $HOME/.vim/.vimrc $HOME/.vimrc
}

function uncache_plugged_dir {
	tar xvf $HOME/configs/nvim/plugged.tar.bz2 -C $HOME/configs/nvim
}

function gvim_cfg_install {
	#remove any previous configuration
	rm -rf $HOME/.vim
	rm -f $HOME/.vimrc
	#create the new links
	ln -s $HOME/configs/nvim $HOME/.vim
	ln -s $HOME/configs/nvim/init.vim $HOME/.vimrc
}

function nvim_cfg_install {
	#remove any previous configuration
	rm -rf $HOME/.config/nvim
	#create the new link
	ln -s $HOME/configs/nvim $HOME/.config/nvim
}

function awesome_cfg_install {
	#remove any previous configuration
	rm -rf $HOME/.config/awesome
	rm -f $HOME/.xscreensaver
	#create the new links
	ln -s $HOME/configs/awesome $HOME/.config/awesome
	ln -s $HOME/configs/.xscreensaver $HOME/.xscreensaver
}

function emacs_cfg_install {
	#remove any previous configuration
	rm -f $HOME/.spacemacs
	rm -f $HOME/.emacs.d/private/cdl
	#create the new links
	ln -s $HOME/configs/.spacemacs $HOME/.spacemacs
	ln -s $HOME/configs/spacemacs_layers $HOME/.emacs.d/private/cdl
}

function install_oh_my_zsh_config {
	#Remove previous config
	rm -f $HOME/.zshrc
	#create the new link
	ln -s $HOME/configs/.zshrc $HOME/.zshrc
}
#### install old vim
gvim_old_cfg_install

#### Restore plugged cache
uncache_plugged_dir

#### install vim
gvim_cfg_install

#### install neovim
nvim_cfg_install

#### install awesome
awesome_cfg_install

#### install emacs
emacs_cfg_install

#### install oh my zsh
install_oh_my_zsh_config

echo Configuration files installed !
echo Enjoy
