autoload -U promptinit
promptinit

# Enable parameter expansion, command substitution and arithmetic expansion in prompts
setopt prompt_subst

# Load the colors
autoload -U colors;
colors;

# Create a separation bar after the path
# see: http://aperiodic.net/phil/prompt/
function precmd {
  # Compute the lengths of the strings
  local exitcodesize=${#${(%):-%(?..%? )}}
  local promptsize=${#${(%):-hh-mm-ss-}}
  local pwdsize=${#${(%):-$PWD}}

  # Global width
  local TERMWIDTH
  (( TERMWIDTH = ${COLUMNS} - 1 ))

  # The horizontal bar
  PR_FILLBAR=""
  # The path, truncated if too long
  PR_PWDLEN=""

  # Compute the path length and the horizontal bar
  if [[ "$promptsize + $pwdsize + $exitcodesize" -gt $TERMWIDTH ]]; then
    ((PR_PWDLEN=$TERMWIDTH - $promptsize - $exitcodesize))
  else
    PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize + $exitcodesize)))..—.)}"
  fi

}

# Change user/host color if root
if [ $UID -eq 0 ]; then usercolor="red"; else usercolor="green"; fi

# # Finally, set the prompt
# #local user_and_host="%{$fg_bold[$usercolor]%}%n@%m%{$reset_color%}"
# local user_and_host=""
# local the_date="%{$fg_bold[green]%}%D{%H:%M:%S}%{$reset_color%}"
# local last_command_status="%(?..%{$fg_bold[red]%}%? %{$reset_color%})"
# local start_of_input="%{$fg_bold[white]%}$%{$reset_color%}"
# PROMPT='$the_date %{$fg_bold[blue]%}%$PR_PWDLEN<...<$PWD%<<%{$reset_color%} $last_command_status%{$fg_bold[white]%}${(e)PR_FILLBAR}%{$reset_color%}
# $start_of_input '

# # Git prompt, displayed at right (RPROMPT)
# # See: https://github.com/olivierverdier/zsh-git-prompt
# RPROMPT='$(git_super_status)'

#
# Random logic
#

EMOJIS=(🍣 🍺 👾 🚀)


SEL_EMOJI=${EMOJIS[RANDOM % ${#EMOJIS[@]} - 1 ]}
# -------------------------------
# general
# -------------------------------
#local user_and_host="%{$fg_bold[$usercolor]%}%n@%m%{$reset_color%}"
local user_and_host=""
local the_date="%{$fg_bold[yellow]%}%D{%H:%M:%S}%{$reset_color%}"
local last_command_status="%(?..%{$fg_bold[red]%}%? %{$reset_color%})"
local start_of_input="%{$fg_bold[white]%}$SEL_EMOJI%{$reset_color%}"
local pwdrel="%1d"

NEWLINE=$'\n'
# -------------------------------
# git
# -------------------------------

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}[%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{⛔%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{%{$fg_bold[yellow]%}↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[green]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✅%G%}"


GIT_STATUS=''
PROMPT='$the_date %{$fg_bold[blue]%}%$PR_PWDLEN<...<$pwdrel%<<%{$reset_color%} $last_command_status%{$fg_bold[white]%}$(git_super_status)$NEWLINE%{$reset_color%}$'\n'$start_of_input '


