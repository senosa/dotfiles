# My dotfiles
## 使い方

```sh
mkdir ~/src
cd ~/src
git clone git@github.com:senosa/dotfiles.git .
git submodule init
git submodule update

# 既に.zshrcがあるなら退避
mv ~/.zshrc{,.orig}

ln -s ~/src/dotfiles/.zshrc ~
```
