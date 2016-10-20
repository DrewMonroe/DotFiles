#! /usr/bin/env bash

# Set up the basics (bash, tmux, vim)
rm ~/.bashrc
ln -s $PWD/.bashrc ~/.bashrc
rm ~/.vimrc

# Get vim all set up
ln -s $PWD/.vimrc ~/.vimrc
rm ~/.vim
ln -s $PWD/.vim ~/.vim
# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Set up tmux
rm ~/.tmux.conf
ln -s $PWD/.tmux.conf ~/.tmux.conf
rm ~/.tmux_status
ln -s $PWD/.tmux_status ~/.tmux_status
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

echo "prefix + I to get tmux plugins"
