local cfg = {
  floating_window = true,
  toggle_key = "<c-g>",
	close_timeout = 0,
  select_signature_key = "<c-n>",
  handler_opts = {
    border = "rounded" -- double, rounded, single, shadow, none
  },
}

-- function sign
require("lsp_signature").setup(cfg, bufnr)
