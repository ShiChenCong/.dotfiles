local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

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

    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

    use 'ful1e5/onedark.nvim'
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-ui-select.nvim'
    -- use 'tom-anders/telescope-vim-bookmarks.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use "windwp/nvim-autopairs"
    use { "numToStr/Comment.nvim",
      event = 'BufRead',
      config = function()
        require('conf.comment')
      end
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use "tpope/vim-fugitive"
    use { "tpope/vim-surround", event = 'BufRead' }
    use "lewis6991/gitsigns.nvim"
    use "kristijanhusak/defx-git"
    use "kristijanhusak/defx-icons"
    use "Shougo/defx.nvim"
    use { 'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim',
      -- event = 'BufRead',
      -- config = function()
      --   return ('conf.diffview')
      -- end
    }
    use { 'samuelsimoes/vim-jsx-utils', event = 'InsertEnter' }

    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use "onsails/lspkind.nvim"
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use "rafamadriz/friendly-snippets"

    -- use {
    --   'prettier/vim-prettier',
    --   run = 'yarn install',
    --   ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html', 'typescriptreact' }
    -- }

    use "norcalli/nvim-colorizer.lua"
    use { "ThePrimeagen/harpoon", config = function() require('conf.harpoon') end }
    use { "kevinhwang91/nvim-bqf", event = 'InsertEnter',
      config = function()
        require('bqf').setup({ auto_enable = false, })
      end
    }
    use { "phaazon/hop.nvim", event = 'InsertEnter', config = function() require('conf.hop') end }
    use { "windwp/nvim-ts-autotag", event = 'InsertEnter' }
    use { "svban/YankAssassin.vim", event = 'BufRead' }
    use { "mfussenegger/nvim-dap", event = 'InsertEnter' }
    use { "tpope/vim-unimpaired", event = 'BufRead' }
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
    use "mg979/vim-visual-multi"
    use {
      'kyazdani42/nvim-tree.lua'
    }
    use { 'mhartington/formatter.nvim' }
    use { 'https://gitlab.com/yorickpeterse/nvim-pqf.git', config = function()
      require('pqf').setup()
    end }

    use { 'akinsho/git-conflict.nvim', config = function()
      require('git-conflict').setup({
        default_mappings = true, -- disable buffer local mapping created by this plugin
        disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = 'DiffText',
          current = 'DiffAdd',
        }
      })
    end }

    use { "akinsho/toggleterm.nvim", tag = 'v1.*' }
    use { 'AndrewRadev/splitjoin.vim' }
  end,
  config = {
    compile_path = compile_path
  }
})
