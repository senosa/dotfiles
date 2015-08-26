# ------------------------------------------------------- oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh.d/oh-my-zsh-custom
ZSH_THEME='snest'
DISABLE_AUTO_UPDATE='true'
DISABLE_AUTO_TITLE='true'
HIST_STAMPS='yyyy-mm-dd'
plugins=(
  brew
  brew-cask
  bundler
  git
  rbenv
  tmux
  vagrant
)
HISTFILE=$ZDOTDIR/history
source $ZSH/oh-my-zsh.sh
# ------------------------------------------------------- main
export LANG=ja_JP.UTF-8

# ログイン・ログアウト
watch='all'
log
setopt ignore_eof
alias x='exit'

# 3秒以上かかったプロセスの消費時間を表示
REPORTTIME=3

# dircolors
if [ -f ~/.dircolors ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dircolors)
  fi
fi

# ------------------------------------------------------- pager
export PAGER='less'
## $LESSのオプションは常に有効(manとかgit logとか)
## -F  : --quit-if-one-screen
## -i  : --ignore-case
## -j3 : --jump-target=3
## -R  : --RAW-CONTROL-CHARS
## -x2 : --tabs=2
## -X  : --no-init
export LESS='-Fij3Rx2X'
## src-hilite-lesspipe.shがあれば使う
if [[ -f /usr/local/bin/src-hilite-lesspipe.sh ]]; then
  export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
elif [[ -f /usr/share/source-highlight/src-hilite-lesspipe.sh ]]; then
  export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
fi
## 自分で起動する時
## -M : --LONG-PROMPT
## -N : --LINE-NUMBERS
alias less='less -MN'

# ------------------------------------------------------- editor
case $OSTYPE in
  darwin*)
    export EDITOR='reattach-to-user-namespace subl -w'
    ;;
  linux*)
    export EDITOR='vim'
    ;;
esac

# ------------------------------------------------------- directories
# oh-my-zsh/lib/directories.zshで定義されているAlias
# d   'dirs -v | head -10'
# 1~9 'cd -N'
cdpath=(~)

# ------------------------------------------------------- history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
# 重複を削除
setopt hist_ignore_all_dups
setopt hist_save_no_dups
# 余計な空白を削除
setopt hist_reduce_blanks
# 16.6.2 tcsh風のヒストリ検索 p506
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# menuselect中のkey bind
bindkey -M menuselect '^P' up-line-or-history
bindkey -M menuselect '^N' down-line-or-history

# ------------------------------------------------------- completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 5.5.4 補完のグループ化 p147
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format $'%{\e[34m%}%U%d%u%{\e[m%}'

# ------------------------------------------------------- globbing
# 辞書順ではなく数字順に並べる
setopt numeric_glob_sort
# パスを生成したときにディレクトリなら末尾に/を付加
setopt mark_dirs

# ------------------------------------------------------- alias
# ls
# colorオプションはoh-my-zshがセットする
alias l='ls -Ah'
alias ll='ls -lAh'
alias la='ls -lah'

# ファイル操作は確認
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# global alias
# |& はstderrも送る
alias -g L='|& $PAGER'
alias -g G='| grep'
alias -g T='| tail'
alias -g H='| head'

# ------------------------------------------------------- homebrew
# brew cask install で /Applications にインストールする
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# ------------------------------------------------------- go
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
