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

-- set lsp highlight settings lower priority than treesitter
vim.hl.priorities.semantic_tokens = 95

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
  { modifier = "defaultLibrary", priority = 106 },

  { treesitter = "true", group = "@boolean", priority = 107 },
  { treesitter = "false", group = "@boolean", priority = 107 },
}

-- update certain tokens to use a highlight of a higher priority
vim.api.nvim_create_autocmd("LspTokenUpdate", {
  callback = function(args)
    --- @type SemanticToken
    local token = args.data.token
    local node = vim.treesitter.get_node({
      bufnr = args.buf,
      pos = { token.line, token.start_col },
    })

    local ts_type = node and node:type() or ""

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

      if t.treesitter and ts_type == t.treesitter then
        vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, t.group, { priority = priority })
      end
    end
  end,
})
