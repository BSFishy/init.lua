return {
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
      gitbrowse = {
        url_patterns = {
          ["gitlab%.%w+%.?%w*"] = {
            -- copy of `gitlab%.com` from default config
            branch = "/-/tree/{branch}",
            file = "/-/blob/{branch}/{file}#L{line_start}-L{line_end}",
            permalink = "/-/blob/{commit}/{file}#L{line_start}-L{line_end}",
            commit = "/-/commit/{commit}",
          },
        },
      },
    },
  },
}
