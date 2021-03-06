# Originally by Nate Soares, heavily edited.
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
function prompt_char {
    if [[ $status == '0' ]] ; then ;
      echo "%{$fg[red]%}" ; 
    fi
    git branch >/dev/null 2>/dev/null && echo '»' && return
    hg root >/dev/null 2>/dev/null && echo '⇒' && return
    echo '→'
}

function session_name {
    if [[ $TERM == "tmux" ]]; then
        if [[ $(tmux display-message -p "#S") != "0" ]]; then
            echo "%{$fg[blue]%}"$(tmux display-message -p "#S|")
        fi
    fi
}
function window_number {
    if [[ $TERM == "tmux" ]]; then
        echo "%{$fg[blue]%}"$(tmux display-message -p "#I")"%{$fg[white]%}".
    fi
}

COLOR_NAME='%{$fg[magenta]%}'
COLOR_HOST='%{$fg[yellow]%}'
COLOR_DIR='%{$fg[green]%}'
COLOR_ARROW='%{$fg[cyan]%}'

COLOR_DAYNAME='%{$fg[magenta]%}'
COLOR_DAYNUM='%{$fg[magenta]%}%B'
COLOR_MONTH='%{$fg[yellow]%}%b'
COLOR_TIME='%{$fg[green]%}'

COLOR_RESET='%{$reset_color%}%s%u%b'
COLOR_SPACE='%{$fg[white]%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"'!'
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%}"'*'
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"' ✔'

RPROMPT=$COLOR_DAYNAME\$(date +"%a")' '$COLOR_DAYNUM\$(date +"%d")' '$COLOR_MONTH\$(date +"%b")' '$COLOR_TIME\$(date +"%H:%M")' '$COLOR_RESET

PROMPT=\$(session_name)\$(window_number)$COLOR_NAME'%n'$COLOR_SPACE'@'$COLOR_HOST'%m'$COLOR_SPACE':'$COLOR_DIR\$(collapse_pwd)\$(git_prompt_info)$COLOR_ARROW'
'\$(prompt_char)' '$COLOR_RESET

# Vim doesn't recognize .zsh-theme, I can't imagine why.
# vim:ft=zsh
