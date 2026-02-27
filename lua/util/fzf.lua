local M = {}

local builtin = require("fzf-lua.previewer.builtin")

---@param item lsp.CompletionItem
local function getOutput(item)
  if not item then
    return "Resolving documentation..."
  end

  if not item.documentation then
    if item.detail then
      return item.detail
    end

    return "No documentation found"
  end

  if type(item.documentation) == "string" then
    return item.documentation --[[@as string]]
  end

  return item.documentation.value, item.documentation.kind
end

local CompletionPreviewer = builtin.base:extend()

function CompletionPreviewer:new(o, opts, fzf_win)
  CompletionPreviewer.super.new(self, o, opts, fzf_win)
  setmetatable(self, CompletionPreviewer)
  self.resolved = opts.resolved
  return self
end

function CompletionPreviewer:populate_preview_buf(entry_str)
  local tmpbuf = self:get_tmp_buffer() --[[@as integer]]
  local item = self.resolved[entry_str] --[[@as lsp.CompletionItem]]

  local value, kind = getOutput(item)
  if not kind then kind = "plaintext" end

  vim.api.nvim_set_option_value("filetype", kind, { buf = tmpbuf })
  vim.api.nvim_buf_set_lines(tmpbuf, 0, -1, false, vim.split(value, "\n"))

  self:set_preview_buf(tmpbuf)
  self.win:update_preview_scrollbar()
end

function CompletionPreviewer:gen_winopts()
  local new_winopts = {
    wrap = true,
    number = false
  }
  return vim.tbl_extend("force", self.winopts, new_winopts)
end

function M.completion()
  local params = {
    textDocument = vim.lsp.util.make_text_document_params(),
    position = vim.lsp.util.make_position_params(0, 'utf-8').position,
    context = { triggerKind = 1 },
  }

  local clients_completed = 0
  local completions = {}
  local resolved = {}
  local requests, cancel = vim.lsp.buf_request(0, "textDocument/completion", params, function(_, result)
    if not result then
      clients_completed = clients_completed + 1
      return
    end

    local items = result.items or result
    for _, item in ipairs(items) do
      local display = string.format("%10s %s",
        "[" .. (vim.lsp.protocol.CompletionItemKind[item.kind] or "?") .. "]",
        item.label
      )

      completions[display] = item

      vim.lsp.buf_request(0, "completionItem/resolve", item, function(_, res)
        if not res then return end
        resolved[display] = res
      end)
    end

    clients_completed = clients_completed + 1
  end)

  local success = vim.wait(10000, function()
    return clients_completed == #requests
  end, 10)

  if not success then
    cancel()
    vim.notify("Completions not found in time", vim.log.levels.ERROR)
    return
  end

  FzfLua.fzf_exec(
    vim.tbl_keys(completions),
    {
      resolved = resolved,
      previewer = CompletionPreviewer,
      actions = {
        ['default'] = function(selected)
          assert(#selected == 1, "Invalid selection")

          local item = completions[selected[1]]
          local SNIPPET = vim.lsp.protocol.InsertTextFormat.Snippet
          local text = item.insertText or item.label

          if item.insertTextFormat == SNIPPET then
            vim.snippet.expand(text)
          else
            vim.api.nvim_put({ text }, "c", true, true)
          end

          if item.command then
            vim.lsp.buf_request(0, "workspace/executeCommand", { command = item.command })
          end
        end,
      },
    }
  )
end

return M
