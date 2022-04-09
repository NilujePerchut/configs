CONFIG_DIR := $(CURDIR)

######################
# Install/Remove everything
######################

PHONY: all clean
all: xvim zsh i3 doom_emacs vscode
clean: clean_xvim clean_zsh i3_clean clean_doom_emacs clean_vscode

######################
# MISC
######################

PHONY += register_bins

# For now, just set chmod +x all binaries
register_bins:
	chmod +x $(CONFIG_DIR)/*

######################
# i3
######################

PHONY += i3 i3_clean

i3_clean:
	@# Remove any previous configuration
	rm -rf $(HOME)/.config/i3
	rm -rf $(HOME)/.config/gsimplecal
	rm -rf $(CONFIG_DIR)/i3/user_config

i3: i3_clean register_bins
	@# Create a working copy to enable patching without messing with git
	@# Rember to add it to the .gitignore
	cp $(CONFIG_DIR)/i3/config $(CONFIG_DIR)/i3/user_config

	@# Patches the configuration file to handle the ~ problem at work
	@# Do it in bith cases to avoid a stupid if clause
	sed -i.original 's,~/,'$(HOME)/',g' $(HOME)/configs/i3/user_config

	@# Create the new links
	mkdir $(HOME)/.config/i3
	ln -s $(HOME)/configs/i3/user_config $(HOME)/.config/i3/config
	mkdir $(HOME)/.config/gsimplecal
	ln -s $(HOME)/configs/i3/gsimplecal_config $(HOME)/.config/gsimplecal/config


######################
# vim, gvim and neovim
######################

PHONY += vim_uncache clean_gvim gvim clean_nvim nvim xvim clean_xvim

# Common
vim_uncache:
	tar xvf $(CONFIG_DIR)/nvim/plugged.tar.bz2 -C $(CONFIG_DIR)/nvim

# gvim
clean_gvim:
	@# remove any existing configuration
	rm -rf $(HOME)/.vim
	rm -f $(HOME)/.vimrc

gvim: vim_uncache clean_gvim

	@#create the new links
	ln -s $(CONFIG_DIR)/nvim $(HOME)/.vim
	ln -s $(CONFIG_DIR)/nvim/init.vim $(HOME)/.vimrc

# neovim
clean_nvim:
	@# remove any existing configuration
	mkdir -p $(HOME)/.config
	rm -rf $(HOME)/.config/nvim

nvim: vim_uncache clean_nvim
	@# create the new link
	ln -s $(CONFIG_DIR)/nvim $(HOME)/.config/nvim

# all vim related targets
xvim: gvim nvim

clean_xvim: clean_gvim clean_nvim


######################
# Zsh
######################

PHONY += zsh clean_zsh

clean_zsh:
	@# Remove ohmyzsh
	rm -rf $(HOME)/install.sh
	@# Remove existing config
	rm -f $(HOME)/.zshrc
	@# Remove existing zim
	rm -rf $(HOME)/.zimrc $(HOME)/.zim
	@# Remove PowerLevel10 config
	rm -rf $(HOME)/.p10k.zsh
	@# Remove .zsh dir
	rm -rf $(HOME)/.zsh

# Assumes, zsh is installed
zsh: clean_zsh
	@# Install zim
	rm -rf $(HOME)/.zimrc
	ln -s $(CONFIG_DIR)/zsh/.zimrc $(HOME)/.zimrc
	(cd $(HOME) && \
	 wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh \
	)
	ln -s $(CONFIG_DIR)/zsh/.p10k.zsh $(HOME)/.p10k.zsh
	rm -f $(HOME)/.zshrc
	ln -s $(CONFIG_DIR)/zsh/.zshrc $(HOME)/.zshrc
	ln -s $(CONFIG_DIR)/zsh $(HOME)/.zsh
	zsh -l

######################
# DOOM emacs
######################

PHONY += doom_emacs clean_doom_emacs

clean_doom_emacs:
	@# Remove Doom and emacs
	rm -rf $(HOME)/.doom.d $(HOME)/.emacs.d

doom_emacs: clean_doom_emacs
	@# Assumes that emacs is installed
	ln -s $(CONFIG_DIR)/.doom.d $(HOME)/.doom.d
	git clone --depth 1 https://github.com/hlissner/doom-emacs $(HOME)/.emacs.d
	@# TODO: find a way to remove the interactive mode
	$(HOME)/.emacs.d/bin/doom install

######################
# VS Code
######################

PHONY += vscode clean_vscode archive_vscode

vscode: clean_vscode
	mkdir -p $(HOME)/.vscode
	mkdir -p $(HOME)/.config/Code
	cat $(CONFIG_DIR)/vscode/extensions | xargs -n1 code --install-extension
	ln -s $(CONFIG_DIR)/vscode/settings.json $(HOME)/.config/Code/User/settings.json
	ln -s $(CONFIG_DIR)/vscode/keybindings.json $(HOME)/.config/Code/User/keybindings.json

clean_vscode:
	rm -rf $(HOME)/.vscode
	rm -rf $(HOME)/.config/Code

archive_vscode:
	code --list-extensions > $(CONFIG_DIR)/vscode/extensions

