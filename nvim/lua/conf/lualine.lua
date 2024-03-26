local status, lualine = pcall(require, "lualine")
if (not status) then return end
local notInTmux = vim.fn.expand("$TERM_PROGRAM") ~= "tmux"
local function getTmux()
  if notInTmux then return '' end
  local handle = io.popen('tmux list-windows')
  local output = handle:read("*a")
  handle:close()
  local lists = vim.split(output, '\n')
  local current_window_name = ''
  local all_windows = ''
  for i, v in pairs(lists) do
    if #v == 0 then
      table.remove(lists, i)
    else
      if v:find('active') then
        current_window_name = v:match('%d:%s%w+')
        all_windows = all_windows .. ' [' .. current_window_name .. ']'
      else
        all_windows = all_windows .. ' ' .. v:match('%d:%s%w+')
      end
    end
  end
  return all_windows
end

vim.o.shortmess = vim.o.shortmess .. "S"

local function search_count()
  if vim.api.nvim_get_vvar("hlsearch") == 1 then
    local res = vim.fn.searchcount({ maxcount = 999, timeout = 500 })

    if res.total > 0 then
      return string.format("%d/%d", res.current, res.total)
    end
  end

  return ""
end

local function lsp_reference_count()
  local ref = require('illuminate.reference')
  local util = require('illuminate.util')
  local winid = vim.fn.win_getid()
  local cursor_pos = util.get_cursor_pos(winid)
  local bufnr = vim.api.nvim_get_current_buf()
  local i = ref.bisect_left(ref.buf_get_references(bufnr), cursor_pos)
  return string.format("%d/%d", i, #ref.buf_get_references(bufnr))
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    globalstatus = true,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    -- lualine_b = { 'branch' },
    lualine_c = {
      -- '%=',
      -- getTmux
      -- lsp_reference_count
      -- {
      --   'filename',
      --   path = 1,
      --   color = { fg = '#545970' },
      -- }
    },
    lualine_x = {
      -- 'encoding',
      lsp_reference_count,
      'searchcount',
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
      },
      -- 'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = {}
  },
  inactive_sections = {
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
  },
  tabline = {},
  extensions = { 'fugitive', 'nvim-tree', 'quickfix', 'toggleterm' }
}
