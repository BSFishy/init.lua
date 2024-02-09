-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set visual identifiers for spaces, tabs, and other whitespace characters
vim.opt.list = true
vim.opt.listchars = {
  -- space = "•", -- This sets spaces to show a dot
  tab = "»·", -- This sets tabs to show a right-pointing guillemet followed by a dot
  -- eol = "¬", -- Optional: Marks the end of line
  trail = "•", -- Optional: Marks trailing spaces
  -- extends = ">", -- Optional: Marks characters extending beyond the right of the screen
  -- precedes = "<", -- Optional: Marks characters extending beyond the left of the screen
}

-- Enable break indent for a visually better soft wrapping
vim.opt.breakindent = true
-- Customize break indent options
vim.opt.breakindentopt = "shift:4"
-- Ensure that lines are wrapped
vim.opt.wrap = true
-- Optionally, set a prefix for wrapped lines
vim.opt.showbreak = "↪ "
