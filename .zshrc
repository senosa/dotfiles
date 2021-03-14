### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-as-monitor \
  zinit-zsh/z-a-bin-gem-node
    
### End of Zinit's installer chunk

zinit light zinit-zsh/z-a-submods

### Prezto
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'
zstyle ':prezto:module:terminal:tab-title' format '%m: %s'
zstyle ':prezto:module:terminal:multiplexer-title' format '%s'

zinit is-snippet for \
  PZT::modules/helper \
  PZT::modules/environment \
  PZT::modules/terminal \
  PZT::modules/editor \
  PZT::modules/history \
  PZT::modules/directory \
  PZT::modules/spectrum \
  PZT::modules/gnu-utility \
  PZT::modules/utility \
  PZT::modules/completion \
  PZT::modules/homebrew
  # PZT::modules/git

zinit ice submods'zsh-users/zsh-history-substring-search -> external'
zinit snippet PZT::modules/history-substring-search
zinit ice submods'zsh-users/zsh-autosuggestions -> external'
zinit snippet PZT::modules/autosuggestions

### plugin
zinit ice wait lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting
zinit light zdharma/history-search-multi-word

zinit light mafredri/zsh-async
zinit ice depth'1'; zinit light denysdovhan/spaceship-prompt

### prezto/runcoms/zprofile

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='ja_JP.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4 -j10'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# /usr/local/bin/src-hilite-lesspipe.sh
if type src-hilite-lesspipe.sh 2>/dev/null 1>/dev/null; then
  export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="$(mktemp -d)"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

### alias
alias cat='bat'
alias ls='exa --time-style=iso'
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
