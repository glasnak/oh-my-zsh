# Personal theme. Similar to robbyrussell and so8res.
# For custom colors, run spectrum_ls and find your own. run spectrum_bls for bg colors.

# kept here for a reference and quick changes.
ALTERNATIVE_UNICODES=' » ➜ → ❯ ...'

# solarized BW, from black to white
SOLAR_BASE03="$FG[234]"
SOLAR_BASE02="$FG[235]"
SOLAR_BASE01="$FG[240]"
SOLAR_BASE00="$FG[241]"
SOLAR_BASE0="$FG[244]"
SOLAR_BASE1="$FG[245]"
SOLAR_BASE2="$FG[254]"
SOLAR_BASE3="$FG[230]"
# solarized colors:
SOLAR_YELLOW="$FG[136]"
SOLAR_ORANGE="$FG[166]"
SOLAR_RED="$FG[160]"
SOLAR_MAGENTA="$FG[125]"
SOLAR_VIOLET="$FG[061]"
SOLAR_BLUE="$FG[033]"
SOLAR_CYAN="$FG[037]"
SOLAR_GREEN="$FG[064]"

COLOR_RESET='%{$reset_color%}%s%u%b'

GIT_SYMBOL='\uE0A0'
PROMPT_CHAR='❯'

COLOR_DIR="$SOLAR_BLUE"     # same as .dircolors folder in `ls`
COLOR_ARROW="$SOLAR_GREEN"
COLOR_DATE="$SOLAR_BASE01"

# show retcode
function return_code() {
    RETCODE=$status
    if [[ $RETCODE != 0 ]] ; then ;
        echo -n "$SOLAR_RED$RETCODE$COLOR_DATE  "
    fi
}

# distinguish root
if [[ $USERNAME == 'root' ]] ; then
    PROMPT_CHAR_COLOR="$SOLAR_RED"
else
    PROMPT_CHAR_COLOR="$SOLAR_GREEN"
fi

# time and retcode on the right
#COLOR_DAYNAME='%{$fg[grey]%}'
# e.g.       Tue 03 Oct 13:33:37
# or     [1] Tue 03 Oct 13:33:37
RPROMPT=\$(return_code)' '$COLOR_RESET$COLOR_DATE\$(date +"%a")' '$COLOR_DATE\$(date +"%d")' '$COLOR_DATE\$(date +"%b")' '$COLOR_DATE\$(date +"%T")' '$COLOR_RESET
# ❯ ~folder (master ✔) 
PROMPT=$PROMPT_CHAR_COLOR$PROMPT_CHAR' '$COLOR_DIR%B'%c '%b\$(git_prompt_info)$COLOR_RESET


ZSH_THEME_GIT_PROMPT_PREFIX="$SOLAR_VIOLET"'('        # '('
ZSH_THEME_GIT_PROMPT_CLEAN="$SOLAR_GREEN"' ✔'         # ' ✔'
ZSH_THEME_GIT_PROMPT_DIRTY="$SOLAR_YELLOW"' ✗'        # ' ✗'
ZSH_THEME_GIT_PROMPT_UNTRACKED="$SOLAR_MAGENTA"' *'   # ' *'
ZSH_THEME_GIT_PROMPT_SUFFIX="$SOLAR_VIOLET"') '       # ')'
