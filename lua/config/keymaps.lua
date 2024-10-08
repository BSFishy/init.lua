-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- I don't really use this anymore
-- Intellij-style info of symbol under cursor
-- map(
--   "n",
--   "<C-q>",
--   "<cmd>lua vim.lsp.buf.hover()<CR>",
--   { noremap = true, silent = true, desc = "Show symbol information" }
-- )
-- map(
--   "i",
--   "<C-q>",
--   "<cmd>lua vim.lsp.buf.hover()<CR>",
--   { noremap = true, silent = true, desc = "Show symbol information" }
-- )
-- map(
--   "v",
--   "<C-q>",
--   "<cmd>lua vim.lsp.buf.hover()<CR>",
--   { noremap = true, silent = true, desc = "Show symbol information" }
-- )

-- Signature help
map("i", "<C-h>", function()
  vim.lsp.buf.signature_help()
end, { desc = "Signature help" })
