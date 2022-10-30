local cfg = {
  floating_window = false,
  -- toggle_key = "<c-g>",
  select_signature_key = "<c-n>",
  handler_opts = {
    border = "rounded" -- double, rounded, single, shadow, none
  },
}

-- function sign
require("lsp_signature").setup(cfg)
