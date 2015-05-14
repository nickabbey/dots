local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT='${ret_status} %{$fg[green]%}%n@%{$fg[yellow]%}%m%{$fg[blue]%}$(virtualenv_info)%{$reset_color%}:%{$fg[cyan]%}%~%{$reset_color%}${vcs_info_msg_0_}% $ '

