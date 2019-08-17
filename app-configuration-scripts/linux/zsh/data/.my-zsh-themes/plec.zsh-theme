default_host="Leopard"

# Machine name.
function box_name {
	[ -f ~/.box_name ] && cat ~/.box_name || echo $HOST
}

# Directory info
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

local ret_status="%(?:%{$fg_bold[green]%}> :%{$fg_bold[red]%}> )"

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $

PROMPT="\
${ret_status}"

PROMPT=$PROMPT"%{$reset_color%}"
PROMPT=$PROMPT"%{$fg[cyan]%}%n "

if [ "$HOST" != "$default_host" ]; then
	PROMPT=$PROMPT"%{$fg[white]%}@\
%{$fg[green]%}$(box_name) "
fi

PROMPT=$PROMPT"\
%{$fg[green]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"