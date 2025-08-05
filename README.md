# Dotfiles

This repository contains my personal configuration files (dotfiles) for various tools and applications. It uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks, making it easy to install and update configurations across different systems.

## Usage

1. Clone this repository to your home directory:
   ```sh
   git clone https://github.com/sahilkathiri/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Use GNU Stow to symlink configurations. For example, to install the `nvim` and `zsh` configs:
   ```sh
   stow nvim zsh
   ```

Each directory corresponds to a set of configuration files for a specific application.

## Applications configured
- ghostty: Terminal of choice
- git: Personal and work git configurations
- lazygit: nvim git ui
- nvim: neovim configuration
- ohmyposh: Shell prompt
- ssh: Used for personal and work git configurations
- tmux: Terminal multiplexer
- zsh: Shell configuration with zinit

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- 
```


