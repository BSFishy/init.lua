return {
  {
    "pocco81/auto-save.nvim",
    enabled = false,
    opts = {
      trigger_events = { "InsertLeave", "CursorHoldI", "FocusLost" },
      write_all_buffers = true,
      debounce_delay = 5000,
    },
  },
}
