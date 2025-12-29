return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 20,
      open_mapping = [[<c-t>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    },
    keys = {
      { '<C-t>', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
      { '<leader>tt', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle Terminal (Float)' },
      { '<leader>tH', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', desc = 'Toggle Terminal (Horizontal)' },
      { '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', desc = 'Toggle Terminal (Vertical)' },
    },
  },
}
