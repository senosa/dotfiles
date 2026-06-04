-- ~/.config/yazi/init.lua
-- Official Git Plugin Setup
require("git"):setup {
  order = 500,
}

-- Custom Linemode Setup
function Linemode:size_mtime()
  local year = os.date("%Y")
  local time = math.floor(self._file.cha.mtime or 0)
  local time_str = os.date(os.date("%Y", time) == year and "%m-%d %H:%M" or "%Y-%m-%d ", time)
  local size_str = self._file:size() and ya.readable_size(self._file:size()) or "-"

  return ui.Line {
    ui.Span(size_str .. " "):fg("#a6e3a1"),
    ui.Span(time_str):fg("#89b4fa"),
  }
end
