vim.opt.termguicolors = true
require("bufferline").setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
    separator_style = "slant",
    custom_filter = function(buf_number, buf_numbers)
      local buf_name = vim.fn.bufname(buf_number)
      if string.find(buf_name, 'fugitive') then
        return false
      end

      if vim.bo[buf_number].filetype == 'qf' then
        return false
      end
      return true
    end
  }
}
