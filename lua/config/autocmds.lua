-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.yml.j2",
  callback = function()
    vim.cmd("set filetype=jinja.yaml")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*", "markdown" },
  callback = function()
    vim.opt_local.textwidth = 80 -- Set desired wrap width
    vim.opt_local.formatoptions:append("c") -- Wrap comments
    vim.opt_local.formatoptions:append("r") -- Continue comments on Enter
  end,
})
