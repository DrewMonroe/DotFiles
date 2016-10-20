#! /usr/bin/env bash

# Set up the basics (bash, tmux, vim)
rm ~/.bashrc
ln -s $PWD/.bashrc ~/.bashrc
rm ~/.vimrc

# Get vim all set up
ln -s $PWD/.vimrc ~/.vimrc
# Set up syntax files
mkdir -p ~/.vim/after/syntax/
rm ~/.vim/after/syntax/c.vim
rm ~/.vim/after/syntax/python.vim
mkdir -p ~/.vim/after/syntax
ln -s $PWD/.vim/after/syntax/c.vim ~/.vim/after/syntax/c.vim
ln -s $PWD/.vim/after/syntax/python.vim ~/.vim/after/syntax/python.vim
# Set up brogrammer theme
mkdir -p ~/.vim/colors
rm ~/.vim/colors/brogrammer.vim
ln -s $PWD/.vim/colors/brogrammer.vim ~/.vim/colors/brogrammer.vim
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
