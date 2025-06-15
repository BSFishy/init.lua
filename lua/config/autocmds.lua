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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.mora",
  callback = function()
    vim.bo.filetype = "mora"
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

---@class SemanticTokenModifiers
---@field declaration boolean?
---@field documentation boolean?
---@field global boolean?

---@class SemanticToken
---@field line number
---@field start_col number
---@field end_col number
---@field marked boolean
---@field type string
---@field modifiers SemanticTokenModifiers

local boost = {
  { type = "namespace" },
  { type = "variable" },

  { modifier = "global" },
  { modifier = "format" },

  { treesitter = "constant.builtin", priority = 106 },
  { treesitter = "namespace.builtin", priority = 106 },
  { modifier = "defaultLibrary", priority = 106 },
  { treesitter = "boolean", priority = 107 },
  { type = "method", priority = 107 },
  { type = "macro", priority = 107 },
}

-- update certain tokens to use a highlight of a higher priority
vim.api.nvim_create_autocmd("LspTokenUpdate", {
  callback = function(args)
    --- @type SemanticToken
    local token = args.data.token
    local captures = vim.treesitter.get_captures_at_pos(args.buf, token.line, token.start_col)

    for _, t in pairs(boost) do
      local priority = t.priority or 105
      if t.type and token.type == t.type then
        vim.lsp.semantic_tokens.highlight_token(
          token,
          args.buf,
          args.data.client_id,
          "@lsp.type." .. t.type,
          { priority = priority }
        )
      end

      if t.modifier and token.modifiers[t.modifier] then
        vim.lsp.semantic_tokens.highlight_token(
          token,
          args.buf,
          args.data.client_id,
          "@lsp.mod." .. t.modifier,
          { priority = priority }
        )
      end

      if t.treesitter then
        for _, capture in pairs(captures) do
          if capture.capture == t.treesitter then
            vim.lsp.semantic_tokens.highlight_token(
              token,
              args.buf,
              args.data.client_id,
              "@" .. t.treesitter,
              { priority = priority }
            )
          end
        end
      end
    end
  end,
})
