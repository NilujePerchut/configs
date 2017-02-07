# VCS Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
  * [Checkers](#checkers)
* [Key Bindings](#key-bindings)

## Description

This layer provides support for vcs. Only supports git for the moment (via vim-fugitive).

### Layer

To use this configuration layer, add it to your `init.vim`/`.vimrc`. You will need to add `+tools/vcs` to the existing `g:dotspaceneovim_configuration_layers` list in this file.

## Key Bindings

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC c       | git commit                                                     | 
| SPC d       | git diff                                                       | 
| SPC r       | git remove                                                     | 
| SPC s       | git status                                                     | 
