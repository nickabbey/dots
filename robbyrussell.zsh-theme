local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    hg prompt --angle-brackets "<%{$fg[magenta]%}hg%{$reset_color%}:%{$fg[blue]%}(%{$fg[red]%}<branch>%{$reset_color%}><:%{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>%{$fg[blue]%})%{$reset_color%}" 2>/dev/null
}

PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}%{$reset_color%}$(hg_prompt_info)$(git_prompt_info)%{$fg_bold[blue]%}$(virtualenv_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}git%{$reset_color%}:%{$fg[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
