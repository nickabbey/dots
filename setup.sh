#!/bin/bash

# remove existing .zshrc 
rm --force ~/.zshrc

# make zsh the login shell as needed (password required interactively)
if [[ `which zsh` != "$SHELL" ]]; then
	chsh -s `which zsh`
fi

# install oh-my-zsh if needed, using curl or wget (die if neither is installed)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
	if [[ `which curl` -ne 0 ]]; then
		curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	elif [[ `which wget` -ne 0 ]]; then
		wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
	else
		echo "missing curl and wget, install one to continue"
		exit
	fi
fi

# link the .zshrc file from version control
ln -s ~/repos/dots/.zshrc ~/.zshrc

#don't forget vim and vundle!
if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# make sure you're using the latest vimrc from dots
rm --force ~/.vimrc
ln -s ~/repos/dots/.vimrc ~/.vimrc

# install plugins from the commandline
vim -c VundleUpdate -c quitall

# output done message
echo "ZSH, oh-my-zsh and vundle installed, initial configs complete.\nYou should log off and back in then run:\nsync_remote"

