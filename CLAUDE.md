# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概要

chezmoi で管理する dotfiles リポジトリ。ソースファイルを編集後に `chezmoi apply` でホームディレクトリへ反映する。

## chezmoi ファイル命名規則

| プレフィックス | 意味 |
|---|---|
| `dot_` | `.` に変換される（隠しファイル/ディレクトリ） |
| `private_` | パーミッション 0600 で展開される |
| `executable_` | 実行可能ファイルとして展開される |

例: `dot_claude/private_settings.json` → `~/.claude/settings.json`（パーミッション 0600）

## よく使うコマンド

```sh
# ソースと実際のファイルの差分を確認
chezmoi diff

# 変更をホームディレクトリへ反映
chezmoi apply

# 特定ファイルのみ反映
chezmoi apply ~/.zshrc

# ホームにあるファイルをソースへ追加
chezmoi add ~/.config/foo/bar

# ホーム側で編集したファイルをソースへ反映（管理済みファイルの逆同期）
chezmoi re-add ~/.config/foo/bar

# 管理ファイルを直接編集（apply 不要）
chezmoi edit ~/.zshrc

# ソースディレクトリへ移動
chezmoi cd
```

## 管理対象の構成

| ソースパス | 展開先 | 用途 |
|---|---|---|
| `dot_zshrc` | `~/.zshrc` | Zsh 設定 |
| `dot_config/git/` | `~/.config/git/` | Git 設定（delta + Catppuccin テーマ） |
| `dot_config/ghostty/` | `~/.config/ghostty/` | Ghostty ターミナル設定 |
| `dot_config/sheldon/` | `~/.config/sheldon/` | Zsh プラグインマネージャー設定 |
| `dot_config/starship.toml` | `~/.config/starship.toml` | プロンプト設定 |
| `dot_config/mise/` | `~/.config/mise/` | 言語バージョン管理（Node/Python/Go/Rust/Deno） |
| `dot_config/yazi/` | `~/.config/yazi/` | ファイルマネージャー設定 |
| `dot_config/btop/` | `~/.config/btop/` | システムモニター設定 |
| `dot_config/karabiner/` | `~/.config/karabiner/` | キーボードカスタマイズ |
| `dot_config/lnav/` | `~/.config/lnav/` | ログビューア設定（Catppuccin テーマ） |
| `dot_config/zed/` | `~/.config/zed/` | Zed エディタ設定 |
| `dot_claude/` | `~/.claude/` | Claude Code 設定（`CLAUDE.md` は全プロジェクト共通のグローバル指示） |

## テーマ・スタイル

全ツールで **Catppuccin Mocha** カラーテーマを統一使用。新しいツール設定を追加する際もこのテーマに合わせる。

## コミットスタイル

Conventional Commits の type (`feat:`/`chore:` 等) は使わない。`scope: 説明` 形式で日本語記述。

```
ghostty: フォント変更・マウス非表示設定を追加
starship: プロンプトレイアウトの改善
zsh: プロンプトキャッシュ有効化の環境変数を追加
```

## sheldon プラグインの更新

```sh
sheldon lock --update
```

変更後は `chezmoi add ~/.config/sheldon/plugins.lock` でロックファイルも管理対象に追加する。
