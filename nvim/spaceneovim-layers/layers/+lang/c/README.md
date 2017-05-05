# C/C++ Layer

## Table of contents

* [Description](#description)
* [Install](#install)
  * [Layer](#layer)
  * [Completion](#completion)
  * [Checkers](#checkers)
* [Key Bindings](#key-bindings)

## Description

This layer provides support for the C/C++ language with the following packages:

* no package yet

### Layer

To use this configuration layer, add it to your `./config/nvim/init.vim`. You will need to add `+lang/c` to the existing dotspaceneovim_configuration_layers list in this file.

### indentation

You can configure the indentation between kernel style (8 spaces per tabs) and standart tabs (4 spaces per tab). Default is 4 spaces per tab.

## Key Bindings

| Key Binding | Description                                                    |
|-------------|----------------------------------------------------------------|
| SPC m t k   | Set kernel style tabs                                          |
| SPC m t s   | Set standart style tabs                                        |
