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
	- 他の設定は dotfiles 管理
- 1Password: ログインして同期
- Dropbox
	- 不要な設定を解除(バックアップ、写真アップロード)
- Alfred
	- Powerpack: アクティベート
	- Advanced:
		- Syncing: ~/Dropbox/Alfred
		- Force Keyboard: ABC
	- General:
		- Hotkey: command+space
		- Permissions: アクセシビリティ、フルディスクアクセス
	- Features:
		- Default Results:
			- Search Scope: Monterey のときだけ？ファイルシステムのルート(/)と外付けストレージで必要なディレクトリのみ登録 (参考: https://www.alfredapp.com/help/troubleshooting/indexing/monterey/ )。遅くなるんじゃないかと心配したけどそんなことなかった。
- iTerm2
	- Preferences: General: Preferences:
		- custom folder: ~/.config/iTerm2
		- Save changes: Automatically
- Path Finder: ライセンスでアクティベート
	- リスト表示の表示オプション:
		- フォント: システムフォント（レギュラー） - 13.0
		- フォルダをボールド表示 OFF
		- アイコンサイズスライドバー: 18 x 18
		- "開く"ボタンを表示 OFF
	- 一般:
		- グローバルアプリケーションメニュー OFF
		- デフォルトのファイルブラウザにする ON
	- ブラウザ:
		- フォルダの command クリック: 新規タブに開く
		- 端に到達したらループ ON
	- 機能
		- 圧縮: アーカイブを Path Finder で解凍する OFF
		- キーボード: ウインドウ>次の(前の)タブを選択、を ctrl(+shift)+tab
- システム環境設定の残り
	- アクセシビリティ
		- ポインタコントロール
			- トラックパッドオプション
				- スクロールの速さ: 一番速く
				- ドラッグを有効: ドラッグロックなし
	- ソフトウェア・アップデート: 詳細: macOS アップデート OFF
	- キーボード
		- キーボード: リピート速く
		- ショートカット:
			- キーボード: 次のウインドウを操作対象にするを option+tab
			- Spotlight: Spotlight 検索を表示 OFF または変更
		- 入力ソース: 日本語-ローマ字入力、ABC、のふたつ
			- 日本語-ローマ字入力: 入力モード: 英字 OFF 他いろいろ
				- ctrl+3 で顔文字が入力されてしまうのは「日本語-ローマ字入力」の時だけ。ABC の時は発生しない。新しいショートカット「顔文字を表示」を設定すれば阻止できると見かけたけど、うまくいかない。メニュー項目ではないしなあ。
	- トラックパッド
		- ポイントとクリック: クリック: 一番弱く
- ~/.ssh
- 各種ログイン
	- Google アカウント: Safari と Chrome でログイン
	- Spark
	- Github
	- VSCode
	- Apple ID
		- iCloud Drive: オプション: デスクトップと書類
- Safari
	- 一般: Safari 起動時: 最後のセッションの全ウインドウ
	- 自動入力: ユーザ名とパスワード OFF (1Password使用)
- カレンダー: 誕生日カレンダーを表示 OFF
- メモ: メニュー>編集>スペルと文法、自動置換: ぜんぶ OFF
- Google Chrome: Google アカウントで Chrome プロフィールを同期
	- デザイン: 終了時の警告メッセージ OFF
- Keka
	- 一般: デフォルトに設定
	- 圧縮: 圧縮後に Finder で表示 OFF、個別の圧縮ファイルを作成 ON
	- 解凍: 解凍後に Finder で表示 OFF
	- ファイルアクセス: ホーム、外部ドライブ
	- Finder拡張機能: 有効化
	- 本体ウインドウで圧縮法を指定、個別の圧縮ファイル作成ON

[1]:https://github.com/mas-cli/mas
