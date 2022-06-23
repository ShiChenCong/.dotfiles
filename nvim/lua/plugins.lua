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

    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", event = 'BufRead', config = function()
      if not vim.g.vscode then require('conf.trouble') end
    end }
    use { "tpope/vim-surround", event = 'BufRead' }
    use { 'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim',
      event = 'BufRead',
      config = function()
        if not vim.g.vscode then
          return ('conf.diffview')
        end
      end
    }
    use { "norcalli/nvim-colorizer.lua", event = 'BufRead', config = function()
      if not vim.g.vscode then
        require('conf.csscolor')
      end
    end }
    use { "kevinhwang91/nvim-bqf", event = 'InsertEnter',
      config = function()
        if not vim.g.vscode then
          require('bqf').setup({ auto_enable = false, })
        end
      end
    }
    use { "phaazon/hop.nvim", event = 'InsertEnter', config = function() require('conf.hop') end }
    use { "windwp/nvim-ts-autotag", event = 'InsertEnter' }
    use { "svban/YankAssassin.vim", event = 'BufRead' }
    -- use { "mfussenegger/nvim-dap", event = 'InsertEnter', config = function()
    --   require('conf.dap')
    -- end }
    use { "tpope/vim-unimpaired", event = 'BufRead' }
    use { 'mhartington/formatter.nvim', event = 'BufRead', config = function()
      if not vim.g.vscode then
        require('conf.formatter')
      end
    end }
    use { 'https://gitlab.com/yorickpeterse/nvim-pqf.git', event = 'BufRead', config = function()
      if not vim.g.vscode then
        require('pqf').setup()
      end
    end }

    use { 'akinsho/git-conflict.nvim', event = 'BufRead', config = function()
      if not vim.g.vscode then
        require('git-conflict').setup({
          default_mappings = true, -- disable buffer local mapping created by this plugin
          disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
          highlights = { -- They must have background color, otherwise the default color will be used
            incoming = 'DiffText',
            current = 'DiffAdd',
          }
        })
      end
    end }

    use { "akinsho/toggleterm.nvim", tag = 'v1.*', event = 'BufRead', config = function()
      if not vim.g.vscode then require('conf.toggleterm') end
    end }
    use { "mg979/vim-visual-multi", event = 'BufRead' }

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

    -- use { 'AndrewRadev/splitjoin.vim', event = 'InsertEnter' }

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

    use { "neovim/nvim-lspconfig", event = { 'BufReadPre' }, config = function() require('lsp') end }

    use { "ThePrimeagen/harpoon", keys = { { 'n', '<C-e>' } }, config = function()
      require('conf.harpoon')
    end }

    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, event = { 'BufRead' }, config = function()
      require('conf.lualine')
    end }
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons', event = { 'BufRead' }, config = function()
      require('conf.bufferline')
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

    use "onsails/lspkind.nvim"

    use "hrsh7th/cmp-nvim-lsp"
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use { 'L3MON4D3/LuaSnip', config = function()
      if not vim.g.vscode then
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snip" } })
      end
    end }
    use 'saadparwaiz1/cmp_luasnip'
    -- use "rafamadriz/friendly-snippets"

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
    use 'lewis6991/impatient.nvim'
    -- use 'vimpostor/vim-tpipeline'
  end,
  config = {
    compile_path = compile_path,
    git = {
      default_url_format = 'https://hub.fastgit.org/%s'
    },
  }
})
