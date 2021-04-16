#
# Exports
#

export HISTSIZE=290000 SAVEHIST=290000 HISTFILE=~/.zhistory
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

export EDITOR='nano' VISUAL='nano' PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4 -j10'
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

if [[ -z "$LANG" ]]; then
  export LANG='ja_JP.UTF-8'
fi

typeset -gU cdpath fpath mailpath path
path=(
  $HOME/bin(N)
  $HOME/go/bin(N)
  /usr/local/{bin,sbin}(N)
  $path
)

#
# Setopts
#

setopt EXTENDED_HISTORY SHARE_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS
setopt HIST_VERIFY HIST_BEEP

setopt COMBINING_CHARS INTERACTIVE_COMMENTS RC_QUOTES
unsetopt MAIL_WARNING

setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT PUSHD_TO_HOME
setopt EXTENDED_GLOB
unsetopt CLOBBER    # Do not overwrite existing files with > and >>.
                    # Use >! and >>! to bypass.

setopt COMPLETE_IN_WORD ALWAYS_TO_END PATH_DIRS AUTO_MENU AUTO_LIST
setopt AUTO_PARAM_SLASH EXTENDED_GLOB NO_BEEP
unsetopt MENU_COMPLETE FLOW_CONTROL

#
# Bindkeys
#

#
# Autoloads
#

autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

#
# Aliases
#

alias cat='bat'

alias ls='exa --time-style=iso --color=always'
alias l='ls -1a'          # in one column, hidden files.
alias ll='ls -l'          # in long view.
alias lT='ll -T'          # in long tree view.
alias lr='ll -R'          # in long view, recursively.
alias la='ll -a'          # in long view, hidden files.
alias lm='la | "$PAGER"'  # in long view, hidden files through pager.
alias lx='ll -h -s=ext'       # sorted by extension.
alias lk='ll -h -s=size'      # sorted by size, largest last.
alias lt='ll -h -umU -s=mod'  # sorted by modified date, most recent last.
alias lc='lt -h -umU -s=cr'   # sorted by created(changed) date, most recent last.
alias lu='lt -h -umU -s=acc'  # sorted by accessed date, most recent last.
alias sl='ls'             # I often screw this up.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

#
# Zinit
#

[[ ! -f ~/.zinit/bin/zinit.zsh ]] && {
    command mkdir -p ~/.zinit
    command git clone https://github.com/zdharma/zinit ~/.zinit/bin
}

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
  zinit-zsh/z-a-as-monitor \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-submods \
  zinit-zsh/z-a-bin-gem-node \
  zinit-zsh/z-a-rust

# Fast-syntax-highlighting & autosuggestions & completions
zinit wait lucid for \
  atinit'zicompinit; zicdreplay' \
    zdharma/fast-syntax-highlighting \
  atload'_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

# A few wait'1 plugins
zinit wait'1' lucid for \
  atinit'zstyle ":history-search-multi-word" page-size "11"' \
    zdharma/history-search-multi-word \

# RUST CLI tools. ogham/exa, sharkdp/bat
zinit wait'2' lucid as'null' from'gh-r' for \
  mv'**/exa* -> exa' sbin  ogham/exa \
  mv'bat* -> bat' sbin'bat/bat'  @sharkdp/bat

zinit lucid depth'1' light-mode for \
  denysdovhan/spaceship-prompt

# Prezto
zinit wait lucid is-snippet for \
  PZTM::terminal \
  PZTM::gnu-utility
  # PZTM::utility
  # PZTM::completion
  # PZTM::homebrew
  # PZTM::git

# zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'
zstyle ':prezto:module:terminal:tab-title' format '%m: %s'
zstyle ':prezto:module:terminal:multiplexer-title' format '%s'

# zinit ice wait"1" lucid submods'zsh-users/zsh-history-substring-search -> external'
# zinit snippet PZTM::history-substring-search # depend on module/editor

zinit wait lucid is-snippet as"completion" for \
  OMZP::docker/_docker \
  OMZP::docker-compose/_docker-compose

#
# Zstyles
#

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
unsetopt CASE_GLOB

zstyle ':completion:*:*:*:*:*' menu select=2
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# ========================================================================

# ### prezto/runcoms/zprofile
# # Browser
# if [[ "$OSTYPE" == darwin* ]]; then
#   export BROWSER='open'
# fi

# ### anyframe
# zinit light mollifier/anyframe
# bindkey '^xg' anyframe-widget-cd-ghq-repository
# bindkey '^xr' anyframe-widget-execute-history
