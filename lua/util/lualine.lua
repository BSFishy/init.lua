local M = {}
local lazy = require('lazy.core.util')

local function realpath(path)
  if path == "" or path == nil then
    return nil
  end
  path = vim.fn.has("win32") == 0 and vim.uv.fs_realpath(path) or path
  return lazy.norm(path)
end

function M.root_dir()
  local function get()
    local cwd = realpath(vim.uv.cwd())
    local name = vim.fs.basename(cwd)
    return name
  end

  return {
    function()
      print(get())
      return "󱉭 " .. get()
    end,
    cond = function()
      return type(get()) == "string"
    end,
    color = function()
      return { fg = Snacks.util.color("Special") }
    end,
  }
end

function M.pretty_path()
  local path = vim.fn.expand("%:p")
  if path == "" then
    return ""
  end

  path = lazy.norm(path)
  local cwd = realpath(vim.uv.cwd())

  if path:sub(1, #cwd) == cwd then
    return path:sub(#cwd + 2)
  end
  return path
end

return M
