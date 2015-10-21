#!/bin/bash

# install oh-my-zsh if needed, using curl or wget (die if neither is installed)
CURL=`which curl`
WGET=`which wget`

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    if [[ -e $CURL ]]; then
		curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	elif [[ -e $WGET ]]; then
		wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
	else
		echo "missing curl and wget, install one to continue"
		exit
	fi
fi

# if bin folder exists and isn't a synlink, mv to tmp, delete dir, create link and copy files
if [ -e "$HOME/bin/" ] && [ ! -h "$HOME/bin" ]; then
    mv $HOME/bin /tmp/my_bins
    ln -s $HOME/repos/dots/bin $HOME/bin
    cp -ab /tmp/my_bins/* $HOME/bin
    rm -rf /tmp/my_bins
elif [ ! -e "$HOME/bin" ]; then # if there IS no ~/bin, create a link
    ln -s $HOME/repos/dots/bin $HOME/bin
fi

# upgrade users pip
pip install --upgrade pip

# install powerline
pip install --user git+git://github.com/Lokaltog/powerline

#force the permission on ~/.oh-my-zsh AND remove the zcomp* files that may cause issues
chown -R `whoami`:`whoami` ~/.oh-my-zsh
chmod -R 755 ~/.oh-my-zsh
rm --force ~/.zcomp*

# remove existing .zshrc
rm --force ~/.zshrc

# link the .zshrc file from version control
ln -s ~/repos/dots/.zshrc ~/.zshrc

# make zsh the login shell as needed (password required interactively)
if [[ `which zsh` != "$SHELL" ]]; then
	chsh -s `which zsh`
fi
#don't forget to install vundle!
if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# make sure you're using the latest vimrc from dots
rm --force ~/.vimrc
ln -s ~/repos/dots/.vimrc ~/.vimrc

# install vundle plugins from the commandline
vim -c VundleUpdate -c quitall

# output done message
echo "ZSH, oh-my-zsh and vundle installed, initial configs complete. You should log off and back in then run: sync_remote"
echo "Additionally, if you had missing powerline packages, run 'pip install --user git+git://github.com/Lokaltog/powerline' "
