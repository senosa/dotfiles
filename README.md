Dotfiles
================================================================

[Ansible][1]を使ってMacの環境構築を自動化する。

Description
----------------------------------------------------------------

Playbookが実行すること。

- homebrewパッケージのインストール
- homebrew caskパッケージのインストール
- senosa/dotfilesのcloneとsymlink作成
- [senosa/prezto][2]のcloneとsymlink作成
- ログインシェルをzshに変更
- [tmux-plugins/tpm][3]のclone
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
- git

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
git clone https://github.com/senosa/dotfiles.git ~/src/github.com/senosa/dotfiles
cd ~/src/github.com/senosa/dotfiles
HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook -i hosts -K mac.yml

# set OSX defaults
./osx.sh

```

tmuxを起動してから、`prefix + I`でtmux-pluginsをインストール

[1]:http://www.ansible.com/home
[2]:https://github.com/senosa/prezto
[3]:https://github.com/tmux-plugins/tpm
