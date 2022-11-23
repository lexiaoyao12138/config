local vim = vim

local ok, line = pcall(require, "lualine")
if not ok then
  vim.notify("lualine is not install!")
  return
end

local navic = require("nvim-navic")
navic.setup {
  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = " ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "練",
    Interface     = "練",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = " ",
    Number        = " ",
    Boolean       = "◩ ",
    Array         = " ",
    Object        = " ",
    Key           = " ",
    Null          = "ﳠ ",
    EnumMember    = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },
  highlight = true,
  separator = "  ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true
}


line.setup {
  options = {
    highlight = true,
    colored = true,
    icons_enabled = true,
    -- theme = 'auto',
    theme = require("transparent").theme(),
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {
      "NvimTree",
      "quickfix",
      "toggleterm",
      "Outline",
      "lspsagaoutline",
      "Trouble",
    },
    always_divide_middle = true,
    globalstatus = true, -- 设置为true, 分屏时lualine为满长度
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      {
        'branch',
        icon = ''
      },
      {
        'diff',
        icons_enabled = true,
        colored = true,
        symbols = { added = ' ', modified = ' ', removed = ' ' },
        diff_color = {
          added    = { fg = '#78BC61' },
          modified = { fg = '#9BCDF2' },
          removed  = { fg = '#E07B5E' }
        }
      },
      {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
      }
    },
    -- lualine_c = { { navic.get_location, cond = navic.is_available } },
		lualine_c = {  },
    lualine_x = { 'encoding',
      {
        'fileformat',
        highlight = true,
        colored = true,
        symbols = { unix = '', dos = '', mac = '' },
        color = { fg = '#28B6FF' }
      },
      {
        'filename',
        file_status = true,
        shorting_target = 50,
        path = 0,
        colored = true,
        symbols = {
          modified = '➕', -- Text to show when the file is modified.
          readonly = '牢 ', -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
          newfile = '[New]', -- Text to show for new created file before first writting
        }
      }
    },
    lualine_y = { 'progress' },

    lualine_z = {
      function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return " LSP:" .. client.name
          end
        end
        return " LSP:" .. msg
      end,
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'buffers' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
		lualine_a = { 'filename' },
    lualine_b = { { navic.get_location, cond = navic.is_available }  },

		lualine_z = { 'buffers' }
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {
    "quickfix",
  }
}
