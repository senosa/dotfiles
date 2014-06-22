# this theme depends on git plugin.

function str_with_color() {
    echo "%{$fg[$1]%}%{$bg[$2]%}$3%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_ADDED=$(str_with_color cyan gray '+')
ZSH_THEME_GIT_PROMPT_MODIFIED=$(str_with_color yellow gray '*')
ZSH_THEME_GIT_PROMPT_DELETED=$(str_with_color red gray 'x')
ZSH_THEME_GIT_PROMPT_RENAMED=$(str_with_color blue gray 'o')
ZSH_THEME_GIT_PROMPT_UNMERGED=$(str_with_color magenta gray '!')
ZSH_THEME_GIT_PROMPT_UNTRACKED=$(str_with_color magenta gray '?')

function my_git_status() {
    [ $(current_branch) ] && echo "($(current_branch)$(git_prompt_status))"
}

DATE_TIME=$(str_with_color black blue '[%D{%Y-%m-%d %K:%M]}')
CURRENT_DIRECTORY=$(str_with_color green gray '%~')
PROMPT_CHAR=$(str_with_color white gray '$ ')

PROMPT='${DATE_TIME}${CURRENT_DIRECTORY} $(my_git_status)
$PROMPT_CHAR'
PROMPT2=$(str_with_color white black '> ')

if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]
then
  USER_NAME=$(str_with_color black green '%n')
  SEPARATOR2=$(str_with_color black white '@')
  SEPARATOR3=$(str_with_color black white ':')
  HOST_NAME=$(str_with_color black cyan '%m')

  PROMPT='${DATE_TIME}${USER_NAME}${SEPARATOR2}${HOST_NAME}${SEPARATOR3}${CURRENT_DIRECTORY} $(my_git_status)
$PROMPT_CHAR'
fi
