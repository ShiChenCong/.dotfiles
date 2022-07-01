local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
-- 配合vscode-neovim插件
_G.scc = function()
  local file = io.open(compile_path, 'r')
  if file ~= nil then
    local content = file:read("*all")
    local newContent = 'if vim.g.vscode then return end\n' .. content
    file:close()
    file = io.open(compile_path, 'w')
    file:write(newContent)
    file:close()
  end
end
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'

    --------------------------------------------------lazyload--------------------------------------------------------------------
    use { "windwp/nvim-autopairs", event = 'InsertEnter', config = function() require('conf.autopairs') end, cond = function() return not vim.g.vscode end }

    -- work in vscode
    use { "tpope/vim-surround", event = 'BufRead' }
    use { "svban/YankAssassin.vim", event = 'BufRead' }
    use { "phaazon/hop.nvim", event = 'InsertEnter', config = function() require('conf.hop') end }
    use { "tpope/vim-unimpaired", event = 'BufRead' }

    -- work in neovim
    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", event = 'BufRead', config = function() require('conf.trouble') end, cond = function() return not vim.g.vscode end }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', event = 'BufRead', config = function() return ('conf.diffview') end, cond = function() return not vim.g.vscode end }
    use { "norcalli/nvim-colorizer.lua", event = 'BufRead', config = function() require('conf.csscolor') end, cond = function() return not vim.g.vscode end }
    use { "kevinhwang91/nvim-bqf", event = 'InsertEnter', config = function() require('bqf').setup({ auto_enable = false, }) end, cond = function() return not vim.g.vscode end }
    use { "windwp/nvim-ts-autotag", event = 'InsertEnter', cond = function() return not vim.g.vscode end }
    use { "mfussenegger/nvim-dap", keys = { '<leader>da' }, config = function() require('conf.dap') end, cond = function() return not vim.g.vscode end }
    use { 'mhartington/formatter.nvim', event = 'BufRead', config = function() require('conf.formatter') end, cond = function() return not vim.g.vscode end }
    use { 'https://gitlab.com/yorickpeterse/nvim-pqf.git', event = 'BufRead', config = function() require('pqf').setup() end, cond = function() return not vim.g.vscode end }
    use { 'akinsho/git-conflict.nvim', event = 'BufRead', config = function()
      require('git-conflict').setup({ default_mappings = true, disable_diagnostics = false, highlights = { incoming = 'DiffText', current = 'DiffAdd', } })
    end, cond = function() return not vim.g.vscode end }

    use { "akinsho/toggleterm.nvim", tag = 'v1.*', event = 'BufRead', config = function()
      if not vim.g.vscode then require('conf.toggleterm') end
    end }
    use { "mg979/vim-visual-multi", event = 'BufRead', cond = function() return not vim.g.vscode end }

    use { 'nvim-telescope/telescope.nvim', after = 'trouble.nvim', requires = { { 'nvim-lua/plenary.nvim' }, }, cmd = { "Telescope" }, config = function()
      if not vim.g.vscode then require('conf.telescope') end
    end }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'telescope.nvim', config = function()
      require('telescope').load_extension('fzf')
    end }
    use { 'nvim-telescope/telescope-ui-select.nvim', after = 'telescope.nvim', config = function()
      require("telescope").load_extension("ui-select")
    end }

    use { "lewis6991/gitsigns.nvim", event = 'BufReadPre', config = function()
      if not vim.g.vscode then require('conf.gitsign') end
    end }
    use { "tpope/vim-fugitive", cmd = 'Git' }

    use { 'kyazdani42/nvim-tree.lua', cmd = 'NvimTreeToggle', config = function()
      if not vim.g.vscode then require('conf.nvim-tree') end
    end }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', event = 'BufRead', config = function()
      if not vim.g.vscode then require('conf.treesitter') end
    end }
    use { "numToStr/Comment.nvim", after = "nvim-treesitter", branch = 'jsx', config = function()
      if not vim.g.vscode then require('conf.comment') end
    end }

    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', event = 'BufRead', config = function()
      if not vim.g.vscode then require('conf.ufo') end
    end }

    use { "neovim/nvim-lspconfig", event = { 'BufReadPre' }, config = function()
      if not vim.g.vscode then require('lsp') end
    end }

    use { "ThePrimeagen/harpoon", keys = { { 'n', '<C-e>' } }, config = function()
      if not vim.g.vscode then require('conf.harpoon') end
    end }

    --------------------------------------------------非lazyload--------------------------------------------------------------------
    -- use {
    --   'romgrk/barbar.nvim',
    --   requires = { 'kyazdani42/nvim-web-devicons' }
    -- }
    ---主题
    -- use 'ful1e5/onedark.nvim'
    use({ "catppuccin/nvim", as = "catppuccin" })

    use "kristijanhusak/defx-git"
    use "kristijanhusak/defx-icons"
    use "Shougo/defx.nvim"

    use { "onsails/lspkind.nvim", module = { 'lspkind' } }

    use {
      { 'hrsh7th/nvim-cmp',
        config = function()
          if not vim.g.vscode then require('conf.cmp') end
        end,
        event = 'InsertEnter *'
      },
      { 'L3MON4D3/LuaSnip', config = function()
        if not vim.g.vscode then
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snip" } })
        end
      end, module = { 'luasnip', 'LuaSnip' } },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', module_pattern = { 'cmp_nvim_lsp' } },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    }

    -- use {
    --   'rmagatti/auto-session',
    --   config = function()
    --     require('auto-session').setup {
    --       log_level = 'info',
    --       auto_session_suppress_dirs = { '~/', '~/Projects' }
    --     }
    --     vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
    --   end
    -- }
    -- use 'famiu/bufdelete.nvim'
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = function()
      if not vim.g.vscode then require('conf.lualine') end
    end }
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons', config = function()
      if not vim.g.vscode then require('conf.bufferline') end
    end }
    use 'lewis6991/impatient.nvim'

    use { "tiagovla/scope.nvim", config = function()
      require("scope").setup()
    end, cond = function() return not vim.g.vscode end }
    use { 'vimpostor/vim-tpipeline', cond = function() return not vim.g.vscode end }
  end,
  config = {
    compile_path = compile_path,
    git = {
      default_url_format = 'https://hub.fastgit.org/%s',
      clone_timeout = 20
    },
  }
})
