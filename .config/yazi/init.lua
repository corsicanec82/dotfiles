-- Full border
-- https://yazi-rs.github.io/docs/tips/#full-border
require("full-border"):setup()

-- Show user/group of files in status bar
-- https://yazi-rs.github.io/docs/tips/#user-group-in-status
Status:children_add(function()
  local h = cx.active.current.hovered
  if h == nil or ya.target_family() ~= "unix" then
    return ""
  end

  return ui.Line {
    ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
    ":",
    ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
    " ",
  }
end, 500, Status.RIGHT)

-- Show symlink in status bar
-- https://yazi-rs.github.io/docs/tips/#symlink-in-status
function Status:name()
  local h = self._current.hovered
  if not h then
    return ""
  end

  -- return " " .. h.name:gsub("\r", "?", 1)
  local linked = ""
  if h.link_to ~= nil then
    linked = " -> " .. tostring(h.link_to)
  end
  return ui.Line(" " .. h.name .. linked)
end
