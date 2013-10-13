#!/bin/bash
#
# This script is written to be launched into the configs
# directory. 
#
# It will install all the configuration using links
#

function gvim_cfg_install {
	#remove any previous configuration
	rm -rf .gvim
	rm -f .gvimrc
	#create the new links
	ln -s configs .gvim
	ln -s .gvim/.vimrc .vimrc	
}

function awesome_cfg_install {
	#remove any previous configuration
	rm -rf .config/awesome
	#create the new links
	ln -s configs/awesome .config/awesome
}

#cd into home
cd ..
#install vim
gvim_cfg_install()
#install awesome
awesome_cfg_install() 

echo Configuration files installed !
echo Enjoy
