#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Forest / suburban prompt
# Palette: olive, dust, muted, burgundy

if [[ $- == *i* ]]; then
    _prompt_reset='\[\033[0m\]'
    _prompt_olive='\[\033[38;2;101;105;87m\]'
    _prompt_dust='\[\033[38;2;193;191;177m\]'
    _prompt_muted='\[\033[38;2;133;140;135m\]'
    _prompt_burgundy='\[\033[38;2;84;60;70m\]'

    _forest_prompt() {
        local status=$?

        PS1=''

        # Working directory
        PS1+="${_prompt_muted}\w${_prompt_reset}\n"

        # Show the previous command's exit status only on failure
        if (( status != 0 )); then
            PS1+="${_prompt_burgundy}× ${status} ${_prompt_reset}"
        fi

        # Prompt character
        PS1+="${_prompt_olive}❯${_prompt_reset} "
    }

    PROMPT_COMMAND=_forest_prompt
fi
