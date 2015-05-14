# Path to your oh-my-zsh installation.
export ZSH=/Users/nickabbey/.oh-my-zsh

# Load antigen for zsh easy configs
source /Users/nickabbey/DevOps/antigen/antigen.zsh

# Directory stack
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
	  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
	    [[ -d $dirstack[1] ]] && cd $dirstack[1]
 fi
chpwd() {
	print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries from dirstack
#setopt pushdignoredups
#
### This reverts the +/- operators in the dirstack
#setopt pushdminus

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nico"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

# User configuration
autoload -Uz vcs_info
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
#   export EDITOR='vim'
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

# git aliases
alias gs="git status"
alias gl="git log"
alias gf="git fetch"
alias gp="git push"
alias ga="git add ."
alias gA="git add . -A"
# git syntactic sugar 
gcp () {git commit -m $1 && git push  }
