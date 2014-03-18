# My dotfiles
This repository is optimized for me. You can clone or fork them freely, but I don't guarantee that they fit you.

## Usage

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

## An end goal
* `git clone`, `rake setup`ですべて完了すること
* 汎用的であること
