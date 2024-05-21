-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Intellij-style info of symbol under cursor
vim.keymap.set(
  "n",
  "<C-q>",
  "<cmd>lua vim.lsp.buf.hover()<CR>",
  { noremap = true, silent = true, desc = "Show symbol information" }
)
vim.keymap.set(
  "i",
  "<C-q>",
  "<cmd>lua vim.lsp.buf.hover()<CR>",
  { noremap = true, silent = true, desc = "Show symbol information" }
)
vim.keymap.set(
  "v",
  "<C-q>",
  "<cmd>lua vim.lsp.buf.hover()<CR>",
  { noremap = true, silent = true, desc = "Show symbol information" }
)
