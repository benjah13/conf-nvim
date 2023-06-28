require("nvim-lightbulb").setup {
  ignore = {},
  sign = {
    enabled = true,
    priority = 10,
  },
  float = {
    enabled = true,
    text = "💡",
    win_opts = {},
  },
  virtual_text = {
    enabled = true,
    text = "💡",
    hl_mode = "replace",
  },
  status_text = {
    enabled = true,
    text = "💡",
    text_unavailable = "",
  },
  autocmd = {
    enabled = true,
    pattern = { "*" },
    events = { "CursorHold", "CursorHoldI" },
  },
}
