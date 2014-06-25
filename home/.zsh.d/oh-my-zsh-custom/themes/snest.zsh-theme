# this theme depends on git plugin.

function str_with_color() {
    echo "%{$fg[$1]%}%{$bg[$2]%}$3%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_ADDED=$(str_with_color cyan default '+')
ZSH_THEME_GIT_PROMPT_MODIFIED=$(str_with_color yellow default '*')
ZSH_THEME_GIT_PROMPT_DELETED=$(str_with_color red default 'x')
ZSH_THEME_GIT_PROMPT_RENAMED=$(str_with_color blue default 'o')
ZSH_THEME_GIT_PROMPT_UNMERGED=$(str_with_color magenta default '!')
ZSH_THEME_GIT_PROMPT_UNTRACKED=$(str_with_color magenta default '?')

function my_git_status() {
    [ $(current_branch) ] && echo "($(current_branch)$(git_prompt_status))"
}

DATE_TIME=$'\e[92;7m[%D{%Y-%m-%d %K:%M]}\e[27m'
# DATE_TIME=$(str_with_color black blue '[%D{%Y-%m-%d %K:%M]}')
CURRENT_DIRECTORY=$(str_with_color green default '%~')
PROMPT_CHAR=$(str_with_color default default '$ ')

PROMPT='${DATE_TIME} ${CURRENT_DIRECTORY} $(my_git_status)
$PROMPT_CHAR'
PROMPT2=$(str_with_color white black '> ')

if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]
then
  USER_NAME=$(str_with_color black green '%n')
  HOST_NAME=$(str_with_color black cyan '@%m')

  PROMPT='${DATE_TIME}${USER_NAME}${HOST_NAME} ${CURRENT_DIRECTORY} $(my_git_status)
$PROMPT_CHAR'
fi
