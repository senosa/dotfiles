# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
ZSH_THEME="snest"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
plugins=(bundler git vagrant)
source $ZSH/oh-my-zsh.sh
# -------------------------------------------------------------------------
# # 文字コード
# export LANG=ja_JP.UTF-8

# # キーバインド
# ## Emacsキーバインドを使う。
# bindkey -e

# # ディレクトリ移動
# ## カレントディレクトリ中に指定されたディレクトリが見つからなかった場合に
# ## 移動先を検索するリスト。
# cdpath=(~)

# # ヒストリ
# ## メモリ上のヒストリ数。
# ## 大きな数を指定してすべてのヒストリを保存するようにしている。
# HISTSIZE=10000000
# ## 保存するヒストリ数
# SAVEHIST=$HISTSIZE
# ## ヒストリリストに登録する時に、既に同一のコマンドがあればそれを削除する
# setopt hist_ignore_all_dups
# ## ヒストリファイルに保存する時に重複したコマンドラインは（古い方を）削除する
# setopt hist_save_no_dups
# ## コマンドライン中にある余分なスペースは、ヒストリリストに登録する時に削除する
# setopt hist_reduce_blanks
# ## C-sでのヒストリ検索が潰されてしまうため、出力停止・開始用にC-s/C-qを使わない。
# setopt no_flow_control
# ## tcsh風のヒストリ検索 p506
# autoload -Uz history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^P" history-beginning-search-backward-end
# bindkey "^N" history-beginning-search-forward-end

# # 補完
# ## 補完方法毎にグループ化する。
# ### 補完方法の表示方法
# ###   %B...%b: 「...」を太字にする。
# ###   %d: 補完方法のラベル
# zstyle ':completion:*' format '%B%d%b'
# zstyle ':completion:*' group-name ''
# ## 辞書順ではなく数字順に並べる。
# setopt numeric_glob_sort

# # 展開
# ## globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
# setopt mark_dirs

# # 実行時間
# ## 実行したプロセスの消費時間が3秒以上かかったら
# ## 自動的に消費時間の統計情報を表示する。
# REPORTTIME=3

# # ログイン・ログアウト
# ## 全てのユーザのログイン・ログアウトを監視する。
# watch="all"
# ## ログイン時にはすぐに表示する。
# log
# ## ^Dでログアウトしないようにする。
# setopt ignore_eof

# # ページャの設定
# ## lvを優先する。
# if type lv > /dev/null 2>&1; then
#     export PAGER="lv"
# else
#     export PAGER="less"
# fi

# # lvの設定
# ## -c: ANSIエスケープシーケンスの色付けなどを有効にする。
# ## -l: 行が折り返されていても1行として扱い、コピーしたときに改行を入れない。
# export LV="-c -l"

# if [ "$PAGER" != "lv" ]; then
#     alias lv="$PAGER"
# fi

# # lessの設定
# ## -R: ANSIエスケープシーケンスのみ素通しする。
# ## -X: 出力結果を画面に残す
# ## -F: 1画面に収まるなら終了する
# export LESS="-RXF"

# # alias
# ## ページャーを使いやすくする。
# ### grep -r def *.rb L -> grep -r def *.rb |& lv
# alias -g L="|& $PAGER"
# ## grepを使いやすくする。
# alias -g G='| grep'

# ## ファイル操作を確認する。
# alias rm="rm -i"
# alias cp="cp -i"
# alias mv="mv -i"

# ## exitのショートカット。
# alias x="exit"

# # rbenv
# # Add rbenv init to your shell to enable shims and autocompletion.
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"
