CONFIG_DIR := $(CURDIR)
BUILD_DIR := $(CONFIG_DIR)/build
BIN_DIR := $(CONFIG_DIR)/bin

######################
# Install/Remove everything
######################

PHONY: all clean
all: nvim zsh i3 doom_emacs vscode
clean: clean_nvim clean_zsh i3_clean clean_doom_emacs clean_vscode

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
# neovim
######################

PHONY += clean_nvim nvim

# neovim
clean_nvim:
	@# remove any existing configuration
	mkdir -p $(HOME)/.config
	rm -rf $(HOME)/.config/nvim/plugin
	rm -rf $(HOME)/.config/nvim
	rm -rf $(HOME)/.local/share/nvim

nvim: clean_nvim
	@# create the new link
	ln -s $(CONFIG_DIR)/nvim $(HOME)/.config/nvim


######################
# Zsh
######################

PHONY += zsh clean_zsh

clean_zsh:
	@# Remove ohmyzsh
	rm -rf $(HOME)/install.sh
	@# Remove existing config
	rm -f $(HOME)/.zshrc
	@# Remove existing zim [keept to unsure smooth upgrade]
	rm -rf $(HOME)/.zimrc $(HOME)/.zim
	@# Remove PowerLevel10 config [keept to unsure smooth upgrade]
	rm -rf $(HOME)/.p10k.zsh
	@# Remove .zsh dir
	rm -rf $(HOME)/.zsh
	@# Remove starship config
	rm -rf $(HOME)/.config/starship.toml
	@# Remove zsh plugins
	rm -rf $(BUILD_DIR)/zsh-syntax-highlighting
	rm -rf $(BUILD_DIR)/zsh-autosuggestions

# Assumes, zsh is installed
zsh: clean_zsh | $(BUILD_DIR)
	cd $(BUILD_DIR) && \
		curl -O https://starship.rs/install.sh && \
		chmod +x install.sh && \
		./install.sh --yes -b $(BIN_DIR)
	cd $(BUILD_DIR) && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
	cd $(BUILD_DIR) && git clone https://github.com/zsh-users/zsh-autosuggestions.git
	rm -f $(HOME)/.zshrc
	ln -s $(CONFIG_DIR)/zsh/.zshrc $(HOME)/.zshrc
	ln -s $(CONFIG_DIR)/zsh/starship.toml $(HOME)/.config/starship.toml
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

$(BUILD_DIR):
	mkdir -p $@
