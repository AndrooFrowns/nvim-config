return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '<leader>bd', '<cmd>bdelete<cr>', desc = 'Close Buffer' },
    },
    opts = {
      options = {
        mode = 'buffers', -- set to "tabs" to only show tabpages instead
        -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
        right_mouse_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
        left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon', -- | 'underline' | 'none',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        -- max_name_length = 18,
        -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        -- tab_size = 18,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   return "("..count..")"
        -- end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        -- custom_filter = function(buf_number, buf_numbers)
        --   -- filter out filetypes you don't want to see
        --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --     return true
        --   end
        --   -- filter out by buffer name
        --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --     return true
        --   end
        --   -- filter out based on arbitrary rules
        --   -- e.g. filter out vim wiki buffer from tabline in your work repo
        --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --     return true
        --   end
        --   return false
        -- end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            text_align = 'center', -- | "left" | "right"
            separator = true,
          },
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        -- show_buffer_icons = true | false, -- disable filetype icons for buffers
        -- show_buffer_close_icons = true | false,
        -- show_close_icon = true | false,
        -- show_tab_indicators = true | false,
        -- show_duplicate_prefix = true | false, -- whether to show duplicate prefix
        -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --   -- add custom logic
        --   return buffer_a.modified > buffer_b.modified
        -- end
      },
    },
  },
}
