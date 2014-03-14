# -*- sh -*-
# パスの設定
## 重複したパスを登録しない。
typeset -U path
## (N-/): 存在しないディレクトリは登録しない。
##    パス(...): ...という条件にマッチするパスのみ残す。
##            N: NULL_GLOBオプションを設定。globがマッチしなかったり存在しないパスを無視する。
##            -: シンボリックリンク先のパスを評価。
##            /: ディレクトリのみ残す。
path=(
      # 自分用（--prefix=$HOME/localでインストールしたもの）
      $HOME/local/bin(N-/)
      # 自分用（gem install --user-installでインストールしたもの）
      $HOME/.gem/ruby/*/bin(N-/)
      # rbenv用
      $HOME/.rbenv/bin(N-/)
      # Debian GNU/Linux用
      /var/lib/gems/*/bin(N-/)
      # システム用
      /usr/local/bin(N-/)
      /usr/bin(N-/)
      /sbin(N-/)
      /bin(N-/)
      /usr/games(N-/))

# sudo時のパスの設定
## -x: export SUDO_PATHも一緒に行う。
## -T: SUDO_PATHとsudo_pathを連動する。
typeset -xT SUDO_PATH sudo_path
## 重複したパスを登録しない。
typeset -U sudo_path
## (N-/): 存在しないディレクトリは登録しない。
##    パス(...): ...という条件にマッチするパスのみ残す。
##            N: NULL_GLOBオプションを設定。
##               globがマッチしなかったり存在しないパスを無視する。
##            -: シンボリックリンク先のパスを評価。
##            /: ディレクトリのみ残す。
sudo_path=({,/usr/pkg,/usr/local,/usr}/sbin(N-/))

# man用パスの設定
## 重複したパスを登録しない。
typeset -U manpath
## (N-/) 存在しないディレクトリは登録しない。
##    パス(...): ...という条件にマッチするパスのみ残す。
##            N: NULL_GLOBオプションを設定。
##               globがマッチしなかったり存在しないパスを無視する。
##            -: シンボリックリンク先のパスを評価。
##            /: ディレクトリのみ残す。
manpath=(# 自分用
         $HOME/local/share/man(N-/)
         # MacPorts用
         /opt/local/share/man(N-/)
         # Solaris用
         /opt/csw/share/man(N-/)
         /usr/sfw/share/man(N-/)
         # システム用
         /usr/local/share/man(N-/)
         /usr/share/man(N-/))
