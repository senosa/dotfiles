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
- Karabiner-Elements
	- Function keys: スタンダードファンクションキー
	- 他の設定はdotfiles管理
- 1Password: ログインして同期
- Dropbox
	- 不要な設定を解除(バックアップ、写真アップロード)
- Alfred
	- Powerpack: アクティベート
	- Advanced:
		- Syncing: ~/Dropbox/Alfred
		- Force Keyboard: Romaji
	- General:
		- Hotkey: command+space
		- Permissions: アクセシビリティ、フルディスクアクセス
- iTerm2
	- Preferences: General: Preferences:
		- custom folder: ~/.config/iTerm2
		- Save changes: Automatically
- Path Finder: ライセンスでアクティベート
	- 一般: グローバルアプリケーションメニューOFF
	- ブラウザ: 端に到達したらループON
	- 機能
		- 圧縮: アーカイブをPath Finderで解凍するOFF
		- キーボード: ウインドウ>次の(前の)タブを選択、をctrl(+shift)+tab
- システム環境設定の残り
	- アクセシビリティ
		- ポインタコントロール
			- トラックパッドオプション
				- スクロールの速さ: 一番速く
				- ドラッグを有効: ドラッグロックなし
	- ソフトウェア・アップデート: 詳細: macOSアップデートOFF
	- キーボード
		- キーボード: リピート速く
		- ショートカット:
			- キーボード: 次のウインドウを操作対象にするをoption+tab
			- Spotlight: Spotlight検索を表示OFFまたは変更
	- トラックパッド
		- ポイントとクリック: クリック: 一番弱く
- ~/.ssh
- 各種ログイン
	- Googleアカウント: SafariとChromeでログイン
	- Spark
	- Github
	- VSCode
	- Apple ID
		- iCloud Drive: オプション: デスクトップと書類
- Safari
	- 一般: Safari起動時: 最後のセッションの全ウインドウ
	- 自動入力: ユーザ名とパスワードOFF (1Password使用)
- カレンダー: 誕生日カレンダーを表示OFF
- メモ: メニュー>編集>スペルと文法、自動置換: ぜんぶOFF
- Google Chrome: GoogleアカウントでChromeプロフィールを同期
	- デザイン: 終了時の警告メッセージOFF
- Keka
	- 一般: デフォルトに設定
	- 圧縮: 圧縮後にFinderで表示OFF、個別の圧縮ファイルを作成ON
	- 解凍: 解凍後にFinderで表示OFF
	- ファイルアクセス: ホーム、外部ドライブ
	- Finder拡張機能: 有効化
	- 本体ウインドウで圧縮法を指定、個別の圧縮ファイル作成ON

[1]:https://github.com/mas-cli/mas
