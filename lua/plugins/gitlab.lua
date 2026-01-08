return {
  {
    "https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git",
    -- Activate when a file is created/opened
    event = { "BufReadPre", "BufNewFile" },
    -- Activate when a supported filetype is open
    ft = { "go", "javascript", "typescript", "rust" },
    cond = function()
      -- Only activate if token is present in environment variable.
      return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
    end,
    opts = {
      statusline = {
        -- Hook into the built-in statusline to indicate the status
        -- of the GitLab Duo Code Suggestions integration
        enabled = true,
      },
    },
  },
}
