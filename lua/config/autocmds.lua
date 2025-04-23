-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- setup jinja template for yml.j2 files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.yml.j2",
  callback = function()
    vim.cmd("set filetype=jinja.yaml")
  end,
})

-- hard wrap comments at 80 column
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*", "markdown" },
  callback = function()
    vim.opt_local.textwidth = 80 -- Set desired wrap width
    vim.opt_local.formatoptions:append("c") -- Wrap comments
    vim.opt_local.formatoptions:append("r") -- Continue comments on Enter
  end,
})

-- start the protols lsp for proto files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "proto",
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local has_protols = vim.tbl_contains(
      vim.tbl_map(function(c)
        return c.name
      end, clients),
      "protols"
    )
    if not has_protols then
      vim.cmd("LspStart protols")
    end
  end,
})
