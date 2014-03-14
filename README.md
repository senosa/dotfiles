# My dotfiles
## 使い方

```sh
mkdir ~/src
cd ~/src
git clone --recursive git@github.com:senosa/dotfiles.git
# --reursiveオプションは
# git submodule init
# git submodule update
# と同じ

ln -s ~/src/dotfiles/.zshrc ~
ln -s ~/src/dotfiles/.zshenv ~
ln -s ~/src/dotfiles/.tmux.conf ~
```
