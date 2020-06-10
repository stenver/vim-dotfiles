# vim-dotfiles
## For dotfile management:
https://github.com/RichiH/vcsh

Initialize:
```sh
vcsh init vim
vcsh vim remote add origin <remote>
vcsh vim pull origin master
```
# Neovim mac guide

## Install neovim with brew
https://github.com/neovim/neovim
```
brew tap neovim/neovim
brew install neovim
```

# OLD - MIGHT BE NOT NEEDED
## Install neobundle
```
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
```

## Install pip
`sudo easy_install pip`

## Install neovim with python
`pip install neovim --user`

# More python3 NeoVim
```
brew install python3
pip3 install neovim

```
# OLD - MIGHT BE NOT NEEDED - END

## Install dein(Package manager)
- Might be autoinstalled!
https://github.com/Shougo/dein.vim

## Initialize nvim plugins
Simply open `nvim` for the first time - plugins declared in this projects configuration file will be downloaded and installed.

## Install the silver searcher
`brew install the_silver_searcher`

## Install Deoplete
Autocomplete for NeoVim

Check Deoplete install README at: https://github.com/Shougo/deoplete.nvim

## To run tests with shortcut
`sudo chmod ugo-x /usr/libexec/path_helper`

## Install universal-tags
`https://github.com/universal-ctags`

## install coc extensions
https://github.com/neoclide/coc-prettier
https://github.com/neoclide/coc-tsserver
https://github.com/neoclide/coc-eslint
