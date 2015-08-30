Dotfiles
================================================================

Ansibleを使ってMacの環境構築を自動化する。

Description
----------------------------------------------------------------

このPlaybookが実行すること。

- homebrewパッケージのインストール
- homebrew caskパッケージのインストール
- dotfilesのsymlink作成
- ログインシェルをzshに変更
- (WIP)
  - 最新安定版のrubyをrbenvでインストール
  - Atomパッケージのインストール
  - Mackupリストア (after Dropbox sync)

Playbookでは実行しないこと。

- defaultsコマンドでosxの環境設定

Requirement
----------------------------------------------------------------

- Xcode
- homebrew
- ansible

Usage
----------------------------------------------------------------


```bash
# Xcode
sudo xcodebuild -license

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# ansible
brew install ansible

# clone and run (with -vv if you want)
git clone https://github.com/senosa/dotfiles.git ~/dotfiles
cd ~/dotfiles
HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook -i hosts -K mac.yml

# set OSX defaults
./osx.sh
```

Licence
----------------------------------------------------------------

MIT
