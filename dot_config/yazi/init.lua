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
