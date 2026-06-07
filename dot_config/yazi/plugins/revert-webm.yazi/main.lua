local PYTHON = "/Users/sen/src/github.com/senosa/hlib/.venv/bin/python"
local SCRIPT = "/Users/sen/src/github.com/senosa/hlib/scripts/revert_rename_webm.py"

-- ya.sync() 経由で cx（UI スレッド）から選択中ファイルのパスを取得
local get_paths = ya.sync(function(_)
	local paths = {}
	for _, url in pairs(cx.active.selected) do
		paths[#paths + 1] = tostring(url)
	end
	-- 未選択のときはホバー中ファイルを対象にする
	if #paths == 0 then
		local h = cx.active.current.hovered
		if h then
			paths[1] = tostring(h.url)
		end
	end
	return paths
end)

return {
	entry = function()
		local paths = get_paths()
		if #paths == 0 then
			ya.notify { title = "revert-webm", content = "対象ファイルがありません", level = "warn", timeout = 3 }
			return
		end

		-- Command の arg() にテーブルを渡すとスペース入りパスも 1 引数として扱われる
		local output, err = Command(PYTHON)
			:arg(SCRIPT)
			:arg(paths)
			:stdout(Command.PIPED)
			:stderr(Command.PIPED)
			:output()

		if not output then
			ya.notify {
				title = "revert-webm",
				content = "起動失敗: " .. (err or "unknown"),
				level = "error",
				timeout = 5,
			}
			return
		end

		local msg = output.stdout .. output.stderr
		msg = msg ~= "" and msg or (output.status.success and "完了" or "失敗")

		ya.notify {
			title = "revert-webm",
			content = msg,
			level = output.status.success and "info" or "error",
			timeout = 8,
		}
	end,
}
