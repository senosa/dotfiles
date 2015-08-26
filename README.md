Dotfiles
========================================

Ansibleを使ってMacの環境構築を自動化する。

## Description

このPlaybookが実行すること。

- homebrewパッケージのインストール
- homebrew caskパッケージのインストール
- (WIP)
  - dotfilesリポジトリのcloneとsymlink作成
  - デフォルトシェルをzshに変更
  - defaultsコマンドでosxの環境設定
  - 最新安定版のrubyをrbenvでインストール
  - Atomパッケージのインストール
  - Mackupリストア (after Dropbox sync)

## Requirement

- Xcode
- homebrew
- ansible

## Usage

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
HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook -i hosts mac.yml
```

## Licence

MIT
