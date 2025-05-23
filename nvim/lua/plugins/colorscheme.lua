return {
  -- Install and set a colorscheme
  {
    'catppuccin/nvim',
    -- dependencies = {
    --   'RRethy/base16-nvim',
    --   'folke/tokyonight.nvim',
    --   'marko-cerovac/material.nvim',
    -- },
    -- Make sure to load this before all the other start plugins.
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      -- require('base16-colorscheme').with_config {
      --   telescope = false,
      --   indentblankline = true,
      --   notify = false,
      --   ts_rainbow = true,
      --   cmp = true,
      --   illuminate = true,
      --   dapui = true,
      -- }
      -- require('tokyonight').setup {}
      -- require('material').setup {}
      -- Set the colorscheme here.
      require('catppuccin').setup {
        flavour = 'auto', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        compile = {
          enabled = true,
          compile_path = vim.fn.stdpath 'cache' .. '/catppuccin',
          suffix = '_compiled',
        },
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.4, -- percentage of the shade to apply to the inactive window
        },
        no_italic = true, -- Force no italic
        no_bold = true, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = {}, -- Change the style of comments
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          blink_cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          markdown = true,
          neotree = true,
          noice = false,
          which_key = false,
          notify = false,
          fidget = true,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          telescope = {
            enabled = false,
            -- style = 'nvchad',
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      }

      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
