local status_ok, bufferline = pcall(require, 'bufferline')

if not status_ok then
  return
end

local scope_status_ok, scope = pcall(require, 'scope')
if not scope_status_ok then
  return
end

scope.setup()

bufferline.setup({
  options = {
    mode = "buffers",
    numbers = "buffer_id",
    diagnostics = "nvim_lsp",
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'underline',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    color_icons = true,
    show_close_icon = true,
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
    separator_style = "padded_slant",

  }
})
