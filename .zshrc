# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
autoload -U colors && colors
# Load antigen for zsh easy configs
#source /Users/nickabbey/DevOps/antigen/antigen.zsh

#for things that need it
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
HOSTNAME=`hostname -s`

# use --user installed pip packages if they exist
if [ -e $HOME/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

# use ~/bin in path if it exists
if [ -e $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi

#================This whole section needs work=========================
# use the right location for pwerline.zsh in osx or ubuntu
# if [ `uname` = "Darwin" ]; then
#     . ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
# else
#     if [ -e ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]; then
#         . ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#     elif [ -e "/usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh" ]; then
#         . /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
#     elif [ -e "/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh" ]; then
#         . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#     else
#         echo "no zsh powerline bindings found, you probably need to do 'pip install --user git+git://github.com/Lokaltog/powerline' or similar"
#     fi
# fi
#POWERLINE_BINDINGS=$(find ~ -name "powerline.zsh" | grep -v "vim")
#if [ -z $POWERLINE_BINDINGS ]; then
#    . $POWERLINE_BINDINGS
#else
#    echo "No powerline bindings for zsh were found"
#fi
#=====================================================================

source $ZSH/oh-my-zsh.sh

# allows ctrl-s to be remapped in vim:
#alias vim="stty stop '' -ixoff ; vim"
# 'Freezing' tty, so after any command terminal settings will be restored
ttyctl -f

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=$HOME/repos/dots/zsh-customizations

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nico"
#ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(ssh-agent virtualenvwrapper tmux)
plugins=(ssh-agent tmux)

# User configuration
autoload -Uz vcs_info
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa github_id_rsa personal.id_rsa
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%{$fg[green]%}±"
zstyle ':vcs_info:*' unstagedstr "%{$fg[red]%}±"
zstyle ':vcs_info:*' formats "%{$fg[blue]%}(%{$fg[magenta]%}%s%{$reset_color%}:%{$fg[yellow]%}%b%{$reset_color%}:%m%u%c%{$fg[blue]%})%{$reset_color%}"
#zstyle ':vcs_info:hg*' formats "%{$fg[blue]%}(%{$fg[magenta]%}%s%{$reset_color%}:%{$fg[yellow]%}%b%{$reset_color%}:%m%u%c%{$fg[blue]%})%{$reset_color%}"
precmd() {
#	if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
#		zstyle ':vcs_info:git*' formats "%{$fg[blue]%}(%{$fg[magenta]%}%s%{$reset_color%}:%{$fg[yellow]%}%b%{$reset_color%}:%m%u%c%{$fg[blue]%})%{$reset_color%}"
#	} else {
#		zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{red}●%f%F{cyan}]%f'
#	}
	vcs_info
}

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='vim'

#================This whole section needs work=========================
# Find the virtualenv wrapper
# VENVWRAPPER=$(find $HOME -name "virtualenvwrapper.sh")
# if [ -z $VENVWRAPPER ]; then
#     # source the virtualenv wrapper
#     . $VENVWRAPPER
#     export WORKON_HOME=$HOME/.virtualenvs
#     export PROJECT_HOME=$HOME/repos
# else
#     echo "No virtualenvwrapper.sh script was found"
# fi
#======================================================================

export PIP_VIRTUALENV_BASE=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Set personal aliases, overriding those provided by oh-my-zsh libs,
#generic aliases
alias larth="ls -larth"
alias lrth="ls -lrth"
alias sd="sync_dots"
alias la="ls -la"
alias clearclip="echo -n '' | pbcopy"

#aliases for commonly used functions
alias fd="fetch_dots"
alias pd="push_dots"
alias dots="cd ~/repos/dots"

# git aliases
alias gs="git status"
alias gl="git log"
alias gfp="git fetch && git pull"
alias gf="git fetch"
alias gp="git push"
alias ga="git add ."
alias gA="git add . -A"

#quick access to different remote hosts
# s2 = ssh to
# df = dupont facility / lv = las vegas / dub = dublin
# s = system [Legacy] / b = bastion [Newer DevOps jump boxes]
alias s2dfs="ssh dfsystems1a.df.jabodo.com"
alias s2dfb="ssh dfprdvoadmbs1.df.jabodo.com"
alias s2dubs="ssh dubsystems1a.dub.jabodo.com"
alias s2dubb="ssh dubprdvoadmbs1.dub.jabodo.com"
alias s2lvs="ssh lvsystems1a.lv.jabodo.com"
alias s2lvb="ssh lvprdvoadmbs.lv.jabodo.com"

#vagrant shortcuts
alias vu="vagrant up"
alias vh="vagrant halt"
alias vr="vagrant reload"
alias vs="vagrant status"
alias vg="vagrant global-status"

# git syntactic sugar
gc() {git commit -m $1 }
gcp() {git commit -m $1 && git push  }
gacp() {git add . && git commit -m $1 && git push  }
gAcp() {git add . -A && git commit -m $1 && git push  }

vflip() {
    [[ -n $$VIRTUAL_ENV ]] && cd && vagrant reload --provision
}

die() {
	exitcode=${2:-1}
	echo ; echo "### ERROR: $1" ; echo
	exit $exitcode
}


sync_vagrant() {
	rm  --force ~/.zshrc ~/.hgrc ~/.vimrc ~/.start_rhw.sh
	ln -s ~/repos/dots/.zshrc ~/.zshrc
	ln -s ~/repos/dots/.hgrc ~/.hgrc
	ln -s ~/repos/dots/.vimrc ~/.vimrc
	ln -s ~/repos/dots/.start_rhw.sh ~/.start_rhw.sh
	cp /home/vagrant/repos/dots/.virtualenvs/p* ~/.virtualenvs/
}

sync_remote() {
	rm  --force ~/.zshrc ~/.hgrc ~/.vimrc ~/.tmux.conf
	ln -s ~/repos/dots/.zshrc ~/.zshrc
	ln -s ~/repos/dots/.hgrc ~/.hgrc
	ln -s ~/repos/dots/.vimrc ~/.vimrc
	ln -s ~/repos/dots/.tmux.conf ~/.tmux.conf
}

sync_ssh() {
	cp ~/repos/dots/.ssh/authorized_keys ~/.ssh/
	cp ~/repos/dots/.ssh/config ~/.ssh/
	chmod 600 ~/.ssh/*
}

# force pull of dotfiles on remote systems and force push of dotfiles from localmachine
sync_dots() {
	if [[ "$HOSTNAME" = "Nicks-MacBook-Pro" ]] || [[ "$HOSTNAME" = "ip-192-168-11-52" ]]; then
		pushd &> /dev/null
		cd ~/repos/dots
		gA
		gcp $1 
		popd &> /dev/null
	else
		pushd &> /dev/null
		cd ~/repos/dots
		gf origin
		git reset --hard origin/master
	        source .zshrc
		popd &> /dev/null
	fi
}

fetch_dots() {
    pushd &> /dev/null
    cd ~/repos/dots
    gfp
    popd &> /dev/null
}

push_dots() {
    if [ -z $1 ]; then
        echo "A commit message surrounded by double or single quotes is required"
    else
        pushd &> /dev/null
        cd ~/repos/dots
        gAcp $1
        popd &> /dev/null
    fi
}

findXinY(){
    if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]; then
        echo "Usage: findXinY <search path> <file name> <grep string>/n"
        echo "Returns matches of <grep string> across all files matching name <file name> starting in <search path> (inclusive)"
        echo "NOTE - If args 2 or 3 contain spaces, wrap them in double quotes!/n"
    else
        find $1 -name $2 -exec grep $3 {} +
    fi
}

# AWS CLI Tab Completion
if [ -e "/usr/local/bin/aws_zsh_completer.sh" ]; then
    source /usr/local/bin/aws_zsh_completer.sh
else
    echo "no awscli tools  found"
fi

#use cosway for ansible
export NOCOWS=0
