#!/usr/bin/env bash

set -eu

if ! command -v xcodebuild 1>/dev/null; then
  echo 'Xcode is not installed.'
  echo 'mas requires Xcode. Please install the latest version of Xcode from App Store.'
  echo 'For more info, see https://github.com/mas-cli/mas.'
  exit 1
fi

if [ "$(xcode-select -p 1>/dev/null; echo $?)" != 0 ]; then
  echo 'Command line tool is not installed.'
  echo 'Invoked installation.'
  echo 'Please follow prompt window.'
  xcode-select --install
  exit 1
fi

echo 'Configuring macOS'
scripts/configure.sh
echo

echo 'Linking dotfiles'
scripts/deploy.sh
echo

echo 'Setting up homebrew'
if !(type "brew" >/dev/null 2>&1); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew bundle --no-lock
echo

echo "Bootstrapping DONE!"
