-- ~/.config/yazi/init.lua
require("git"):setup {
  order = 500,
}

local function fmt_size(file)
  local s = file:size() and ya.readable_size(file:size()) or "-"
  return string.format("%6s", s)
end

-- Compact: today→HH:MM, this year→MM-DD, older→YYYY
function Linemode:size_mtime()
  local now = os.time()
  local time = math.floor(self._file.cha.mtime or 0)
  local time_str
  if now - time < 86400 then
    time_str = os.date("%H:%M", time)
  elseif os.date("%Y", time) == os.date("%Y") then
    time_str = os.date("%m-%d", time)
  else
    time_str = os.date("%Y", time)
  end
  return ui.Line {
    ui.Span(fmt_size(self._file) .. " "):fg("#a6e3a1"),
    ui.Span(time_str):fg("#89b4fa"),
  }
end

-- Long: today/this year→MM-DD HH:MM, older→YYYY-MM-DD
function Linemode:size_mtime_long()
  local time = math.floor(self._file.cha.mtime or 0)
  local time_str = os.date(
    os.date("%Y", time) == os.date("%Y") and "%m-%d %H:%M" or "%Y-%m-%d",
    time
  )
  return ui.Line {
    ui.Span(fmt_size(self._file) .. " "):fg("#a6e3a1"),
    ui.Span(time_str):fg("#89b4fa"),
  }
end

-- filetype の underline がファイル名を超えて余白・size/mtime 列まで漏れる問題の回避。
-- Yazi の List は行の Line スタイルをペイン全幅に先に塗ってから文字を重ねるため
-- (entity.lua の Entity:redraw)、underline だけ行全体から外しファイル名の span に付け直す。
-- 注意: ui.Style の :underline() 等は引数なし/false で「付与」、true で「除去」という
-- 直感と逆の仕様 (Rust 側の引数名は remove: bool) なので、除去したい側に true を渡す。
function Entity:style()
  local s = self._file:style() or ui.Style()
  if not self._file.is_hovered then
    return s:underline(true)
  elseif self._file.in_current then
    return s:patch(th.indicator.current):underline(true)
  elseif self._file.in_preview then
    return s:patch(th.indicator.preview):underline(true)
  else
    return s:patch(th.indicator.parent):underline(true)
  end
end

function Entity:highlights()
  local name, p = self._file.name, ui.printable
  local highlights = self._file:highlights()
  local underline = (self._file:style() or ui.Style()):raw().underline

  local line
  if not highlights or #highlights == 0 then
    if not underline then
      return p(name)
    end
    line = ui.Line { p(name) }
  else
    local spans, last = {}, 0
    for _, h in ipairs(highlights) do
      if h[1] > last then
        spans[#spans + 1] = p(name:sub(last + 1, h[1]))
      end
      spans[#spans + 1] = ui.Span(p(name:sub(h[1] + 1, h[2]))):style(th.mgr.find_keyword)
      last = h[2]
    end
    if last < #name then
      spans[#spans + 1] = p(name:sub(last + 1))
    end
    line = ui.Line(spans)
  end

  return underline and line:style(ui.Style():underline()) or line
end
