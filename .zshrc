# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
autoload -U colors && colors
# Load antigen for zsh easy configs
#source /Users/nickabbey/DevOps/antigen/antigen.zsh
. /Users/nickabbey/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

#to allow ctrl-s ot be remapped in vim:
#alias vim="stty stop '' -ixoff ; vim"
# Freezing' tty, so after any command terminal settings will be restored
ttyctl -f

# Directory stack
# didn't use this much, and in vagrant it's noisy when changing dirs.
#DIRSTACKFILE="$HOME/.cache/zsh/dirs"
#if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
#	  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
#	    [[ -d $dirstack[1] ]] && cd $dirstack[1]
# fi
#chpwd() {
#	print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
#}

#DIRSTACKSIZE=20

#setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries from dirstack
#setopt pushdignoredups
#
### This reverts the +/- operators in the dirstack
#setopt pushdminus

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
plugins=(ssh-agent virtualenvwrapper tmux)

# User Variables
HOSTNAME=`hostname -s`

# User configuration
autoload -Uz vcs_info
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%{$fg[green]%}±"
zstyle ':vcs_info:*' unstagedstr "%{$fg[red]%}±"
zstyle ':vcs_info:*' formats "%{$fg[blue]%}(%{$fg[magenta]%}%s%{$reset_color%}:%{$fg[yellow]%}%b%{$reset_color%}:%m%u%c%{$fg[blue]%})%{$reset_color%}"
#zstyle ':vcs_info:hg*' formats "%{$fg[blue]%}(%{$fg[magenta]%}%s%{$reset_color%}:%{$fg[yellow]%}%b%{$reset_color%}:%m%u%c%{$fg[blue]%})%{$reset_color%}"
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*' actionformats "(%s|%a)[%i%u %b %m]"
precmd() {
#	if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
#		zstyle ':vcs_info:git*' formats "%{$fg[blue]%}(%{$fg[magenta]%}%s%{$reset_color%}:%{$fg[yellow]%}%b%{$reset_color%}:%m%u%c%{$fg[blue]%})%{$reset_color%}"	
#	} else {
#		zstyle ':vcs_info:*' formats '%F{cyan}[%b%c%u%f%F{red}●%f%F{cyan}]%f'
#	}
	vcs_info
}
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source the virtualenv wrapper
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/repos

#generic aliases
alias larth="ls -larth"
alias lrth="ls -lrth"
alias sd="sync_dots"

# git aliases
alias gs="git status"
alias gl="git log"
alias gfp="git fetch && git pull"
alias gf="git fetch"
alias gp="git push"
alias ga="git add ."
alias gA="git add . -A"
# mercurial aliases
alias hs="hg status"
alias hl="hg log"
alias hu="hg update"
alias hup="hg update && hg pull"
alias hupm="hg update && hg pull && hg merge"
alias hpush="hg push"
alias hpull="hg pull"
alias ha="hg add"

# git syntactic sugar 
gc() {git commit -m $1 }
gcp() {git commit -m $1 && git push  }
gacp() {git add . && git commit -m $1 && git push  }
gAcp() {git add . -a && git commit -m $1 && git push  }

# hg syntactic sugar
hc() {hg commit -m $1 } 

#quick access to local dev env
alias s2v="ssh localdev"
alias neovim="nvim"
alias macvim="mvim"
export PIP_VIRTUALENV_BASE=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1

#vagrant shortcuts
alias vu="cd $HOME/repos/rhw-infrastructure && vagrant up"
alias vh="cd $HOME/repos/rhw-infrastructure && vagrant halt"
alias vr="cd $HOME/repos/rhw-infrastructure && vagrant reload"
alias vs="cd $HOME/repos/rhw-infrastructure && vagrant status"
alias vg="vagrant global-status"

# quickstart of dev env from in or outside of vagrant
start_rhw() {
	if [ `hostname` != "vagrant-instance" ]
	then
		cd $HOME/repos/rhw-infrastructure
	       	echo "starting vagrant, this will fail if it's already running, but that's OK" && vagrant up
       	       	echo "ssh'ing in to vagrant and starting the app" && ssh localdev -t '~/.start_rhw.sh'
	else
		run_rhw
		echo "\ncleaning up (exit virtualenv and return to home folder)" && deactivate && cd ~
	fi	
}

# load jeremy's rhw related shell enhancement
# This needs to be adapted to play nice with zsh so is commented out (for now)
#if [ -f /etc/rhw_bash_additions ]; then
#	source /etc/rhw_bash_additions
#fi

die() {
	exitcode=${2:-1}
	echo ; echo "### ERROR: $1" ; echo
	exit $exitcode
}

_get_sp_home() {
	if [ -n "$VIRTUAL_ENV" ];
	then
		if [ -e "$VIRTUAL_ENV/HOME" ];
		then
			export SPHOME=`cat "$VIRTUAL_ENV/HOME"`
			echo "$SPHOME"
		else
			echo "## WARNING: No $VIRTUAL_ENV/HOME file found.  Please create this containing your project's home sirectory"
		fi
	else
			echo "## No VIRTUAL_ENV found.. you must 'sporkon' first"
	fi
}	

sphome() {
	SPHOME=`_get_sp_home`
	if [ -d "$SPHOME" ];
	then
		cd "$SPHOME"
	else
		echo "$SPHOME"
	fi
}

spmkvirtualenv() {
	mkvirtualenv $@
	echo `pwd`/$1 > $VIRTUAL_ENV/HOME
}
							    
sporkon(){
	[ -z "$1" ] && echo "## ERROR: You must specify an environment name\!" && return 1

	[ -n "$VIRTUAL_ENV" ] && deactivate
	[ -z "$VIRTUALENVWRAPPER_HOOK_DIR" ] && source /usr/local/bin/virtualenvwrapper.sh
	[ ! -d "$VIRTUALENVWRAPPER_HOOK_DIR/$1" ] && echo "## ERROR: No such virtualenv $1... exiting" && return 3
	if workon "$1"
	then
		sphome
	else
		die "### ERROR: problem with 'workon $1'"
		return 4
	fi
	export SPHOME="`_get_sp_home`"
	export PYLINTRC=$SPHOME/.pylintrc
}

list_migrations() {
	sphome
	[ ! -f manage.py ] && echo "##ERROR: $0 only available for django pojects" && return 44
	./manage.py list_migrations | grep -v '\(\*\)'
}

# original version that relies on the $VIRTUAL_ENV/HOME file existing, which has some wierd issue with thinking it's still the ubuntu user
#run_rhw() {
#	sporkon rhw && cd rhw && ./manage.py runserver_plus 192.168.56.101:8000
#}

# my version, just adapted to use my zsh environment and virtualenv config
run_rhw() {
	workon rhw && cd rhw && ./manage.py runserver_plus 192.168.56.101:8000
}

runserver() {
	./manage.py runserver_plus 192.168.56.101:8000
}

sync_vagrant() {
	rm  --force ~/.zshrc ~/.hgrc ~/.vimrc ~/.start_rhw.sh
	ln -s ~/repos/dots/.zshrc ~/.zshrc
	ln -s ~/repos/dots/.hgrc ~/.hgrc
	ln -s ~/repos/dots/.vimrc ~/.vimrc
	ln -s ~/repos/dots/.start_rhw.sh ~/.start_rhw.sh
	cp /home/vagrant/repos/dots/.virtualenvs/p* ~/.virtualenvs/
	source ~/.zshrc
}

sync_remote() {
	rm  --force ~/.zshrc ~/.hgrc ~/.vimrc ~/.tmux.conf
	ln -s ~/repos/dots/.zshrc ~/.zshrc
	ln -s ~/repos/dots/.hgrc ~/.hgrc
	ln -s ~/repos/dots/.vimrc ~/.vimrc
	ln -s ~/repos/dots/.tmux.conf ~/.tmux.conf
	source ~/.zshrc
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

# AWS CLI Tab Completion
source /usr/local/bin/aws_zsh_completer.sh

#use cosway for ansible
export NOCOWS=0

