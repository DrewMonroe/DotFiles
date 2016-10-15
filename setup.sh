#! /usr/bin/env bash

# Set up the basics (bash, tmux, vim)
rm ~/.bashrc
ln -s $PWD/.bashrc ~/.bashrc
rm ~/.vimrc
ln -s $PWD/.vimrc ~/.vimrc
rm ~/.vim
ln -s $PWD/.vim ~/.vim
rm ~/.tmux.conf
ln -s $PWD/.tmux.conf ~/.tmux.conf
rm ~/.tmux_status
ln -s $PWD/.tmux_status ~/.tmux_status
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
echo "prefix + I to get tmux plugins"
