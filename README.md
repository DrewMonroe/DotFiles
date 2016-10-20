# DotFiles
Linux customization files

### Introduction
This repository contains my dotfiles for my prefered Linux customization.
There is a vim color scheme (Brogrammer), which is a modified version of
marciomazza's port of the Sublime Text Brogrammer Theme. There also is a
tmux configuration to make tmux look nicer. I use various plugins (which are
listed below) for both vim and tmux to make my experience better. I also
include my customizations for i3 and termite, however as not everyone uses
those, they are not included in the setup script.

### Installation
There is a `setup.sh` script that will create symlinks to my vim, tmux, and
bash customization files. NOTE: running this script will remove any of the
files that I will symlink to my files, so please backup anything that you
may want before running.

To run the script, simply call it from the command line from this directory
```bash
./setup
```

### Plugins
For vim, I use the following plugins
- vim-flake8 (https://github.com/miyakogi/vim-flake8)
- YouCompleteMe (https://github.com/Valloric/YouCompleteMe)

For tmux, I use the following plugins
- tmux-resurrect (https://github.com/tmux-plugins/tmux-resurrect)
