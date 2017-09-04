# VCS Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
  * [Checkers](#checkers)
* [Key Bindings](#key-bindings)

## Description

This layer provides support for vcs. Only supports git for the moment.


### Layer

To use this configuration layer, add it to your `init.vim`/`.vimrc`. You will need to add `+tools/vcs` to the existing `g:dotspaceneovim_configuration_layers` list in this file.

## Key Bindings

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC gc       | git commit                                                    |
| SPC gd       | git diff                                                      |
| SPC gr       | git remove                                                    |
| SPC gs       | git status                                                    |
| SPC gm       | open a vimagit buffer                                         |
