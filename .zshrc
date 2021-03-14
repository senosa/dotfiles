# .zshrc

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

# Prezto
zinit snippet PZT::modules/helper/init.zsh
zinit snippet PZT::modules/environment/init.zsh
zinit snippet PZT::modules/gnu-utility/init.zsh
zinit snippet PZT::modules/utility/init.zsh
zinit snippet PZT::modules/directory/init.zsh
zinit snippet PZT::modules/history/init.zsh
zinit snippet PZT::modules/history-substring-search/init.zsh
zinit snippet PZT::modules/completion/init.zsh
zinit snippet PZT::modules/homebrew/init.zsh
# zinit snippet PZT::modules/git/alias.zsh
# zinit snippet PZT::modules/git/init.zsh
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'
zstyle ':prezto:module:terminal:tab-title' format '%m: %s'
zstyle ':prezto:module:terminal:multiplexer-title' format '%s'
zinit snippet PZT::modules/terminal/init.zsh

# zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice wait"1" atinit"zpcompinit; zpcdreplay" lucid
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zdharma/history-search-multi-word

# zinit ice from'gh-r' as'program'
# zinit light sei40kr/fast-alias-tips-bin
# zinit light sei40kr/zsh-fast-alias-tips

# prompt
zinit light mafredri/zsh-async
zinit ice depth'1'; zinit light denysdovhan/spaceship-prompt

# path
path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  $path
)

# alias
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
