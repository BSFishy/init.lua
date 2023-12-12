-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- osc52
-- TODO: delete this in nvim v0.10.0
vim.keymap.set("n", "<leader>y", require("osc52").copy_operator, { expr = true })
vim.keymap.set("n", "<leader>yy", "<leader>c_", { remap = true })
vim.keymap.set("v", "<leader>y", require("osc52").copy_visual)

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
