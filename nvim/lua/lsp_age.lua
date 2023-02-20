local keymap = vim.keymap.set
local ok, saga = pcall(require, 'lspsaga')
if not ok then
    vim.notify("lspsage is not install!")
    return
end

saga.setup({
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = "rounded",
    lightbulb = {
        enable = true,
        enable_in_insert = true,
        cache_code_action = true,
        sign = true,
        update_time = 150,
        sign_priority = 20,
        virtual_text = false,
    },
    symbol_in_winbar = {
        enable = true,
        separator = "  ",
    },
    show_outline = {
        win_with = 'db_ui',
        win_width = 40,
    },
    ui = {
        -- Currently, only the round theme exists
        theme = "round",
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "rounded",
        winblend = 0,
        expand = "",
        collapse = "",
        preview = " ",
        code_action = "💡",
        diagnostic = "🐞",
        incoming = " ",
        outgoing = " ",
        hover = ' ',
        kind = {},
    },
    -- diagnostic_header = { " ", " ", " ", "ﴞ " },
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<space>ca", ":Lspsaga code_action<CR>", { silent = true })

--rename
keymap("n", "<space>rn", ":Lspsaga rename<CR>", { silent = true })
keymap("n", "<c-k>", ":Lspsaga hover_doc<CR>", { silent = true })
