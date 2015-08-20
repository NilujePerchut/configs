#!/bin/bash
#
# This script is written to be launched into the configs
# directory.
#
# It will install all the configuration using links
#

function gvim_cfg_install {
	#remove any previous configuration
	rm -rf $HOME/.vim
	rm -f $HOME/.vimrc
	#create the new links
	ln -s $HOME/configs/.vim $HOME/.vim
	ln -s $HOME/.vim/.vimrc $HOME/.vimrc	
}

function awesome_cfg_install {
	#remove any previous configuration
	rm -rf $HOME/.config/awesome
	#create the new links
	ln -s $HOME/configs/awesome $HOME/.config/awesome
}

function emacs_cfg_install {
	#remove any previous configuration
	rm -rf $HOME/.emacs.d
	rm -f $HOME/.emacs
	#create the new links
	ln -s $HOME/configs/.emacs.d $HOME/.emacs.d
	ln -s $HOME/configs/.emacs $HOME/.emacs
}

function install_oh_my_zsh_config {
	#Remove previous config
	rm -f $HOME/.zshrc
	#create the new link
	ln -s $HOME/configs/.zshrc $HOME/.zshrc
}

#install vim
gvim_cfg_install
#install awesome
awesome_cfg_install
#install emacs
emacs_cfg_install
#install oh my zsh
install_oh_my_zsh_config

echo Configuration files installed !
echo Enjoy
