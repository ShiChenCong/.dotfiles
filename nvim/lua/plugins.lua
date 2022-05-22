local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
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

    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", }

    use 'ful1e5/onedark.nvim'
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-ui-select.nvim'
    -- use 'tom-anders/telescope-vim-bookmarks.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }


    use "tpope/vim-fugitive"
    use "tpope/vim-surround"
    use "lewis6991/gitsigns.nvim"
    use "kristijanhusak/defx-git"
    use "kristijanhusak/defx-icons"
    use "Shougo/defx.nvim"
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    -- use "mhinz/vim-startify"
    use 'samuelsimoes/vim-jsx-utils'

    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use {
      'prettier/vim-prettier',
      run = 'yarn install',
      ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html' }
    }
    use "norcalli/nvim-colorizer.lua"
    use "ThePrimeagen/harpoon"
    use "kevinhwang91/nvim-bqf"
    use "phaazon/hop.nvim"
    use "windwp/nvim-ts-autotag"
    use "RRethy/nvim-treesitter-textsubjects"
    use "svban/YankAssassin.vim"
    use "mfussenegger/nvim-dap"
    use "tpope/vim-unimpaired"
    use {
      'rmagatti/auto-session',
      config = function()
        require('auto-session').setup {
          log_level = 'info',
          auto_session_suppress_dirs = { '~/', '~/Projects' }
        }
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
      end
    }
  end
})
