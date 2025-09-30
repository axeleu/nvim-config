return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'tokyonight',
        component_separators = '',
        section_separators = { left = '', right = '' },
        icons_enabled = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff', 'diagnostics' },
        lualine_x = { { function() return os.date("%H:%M") end }, },
        lualine_y = { 'filetype' },
        lualine_z = { { 'location', separator = { right = '' }, left_padding = 3 } },
      },
      -- This is to make lualine less messy when in neo-tree
      extensions = {
        {
          sections = {
            lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
          },
          filetypes = { "neo-tree" }
        },
      },
    })
  end,
}
