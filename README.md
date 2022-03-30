# Dotfiles
My dotfiles

## Requirement
- Sign in to Mac App Store
- command line developer tools: `xcode-select --install`
- macOS 10.14.4 and later
	- [mas][1] requires Swift 5 runtime support.

## Usage
```
curl -L https://raw.githubusercontent.com/senosa/dotfiles/master/bootstrap.sh | bash -s
```
ブランチ名指定は `bash -s -- branchname`

## 手動でやること
- Dropbox (iTerm2とAlfredの同期に使っている)
- システム環境設定の残り
- Alfred
- 1Password
- iTerm2
- ログインだけ(VSCode, Spark, Googleアカウントなど)
- Apple IDサインインは時間とCPUを使うので最後に

[1]:https://github.com/mas-cli/mas
