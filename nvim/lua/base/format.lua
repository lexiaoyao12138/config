local vim = vim

local ok, formatter = pcall(require, "formatter")
if not ok then
    vim.notify("formatter is not install")
    return
end

-- 格式化配置文件路径
-- local language_path = function()
-- 	return vim.fn.getcwd()
-- end
local language_path = "/home/dong/.config/nvim/language/"

local util = require("formatter.util")
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        -- "-style=file:"..language_path().."/cpp.yaml",
                        "-style=file:".. language_path .. "cpp.yaml",
                        -- "-style=Microsoft",
                    },
                    stdin = true,
                }
            end,
        },

        c = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        -- "-style=file:"..language_path().."/cpp.yaml",
                        "-style=file:" .. language_path .. "cpp.yaml",
                        -- "-style=Microsoft",
                    },
                    stdin = true,
                }
            end,
        },

        lua = {
            function()
                return {
                    exe = "CodeFormat",
                    args = {
                        "format",
                        "-c " .. language_path .. "/lua.editorconfig",
                        "-f",
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true,
                }
            end
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})

-- vim.cmd([[
-- 	augroup FormatAutogroup
--   	autocmd!
--   	autocmd BufWritePost * FormatWrite
-- 	augroup END
-- ]])

vim.api.nvim_set_keymap("n", "<space>f", ":Format<CR>", { noremap = true })
