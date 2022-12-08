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
    use { "windwp/nvim-autopairs", after = 'nvim-cmp', config = function() require('conf.autopairs') end }

    use({
      "kylechui/nvim-surround",
      event = 'BufRead',
      config = function()
        require("nvim-surround").setup({
        })
      end
    })
    use { "svban/YankAssassin.vim", event = 'BufRead' }

    -- use { "phaazon/hop.nvim", event = 'InsertEnter', config = function() require('conf.hop') end }
    use { "ggandor/leap.nvim", event = 'BufRead', config = function()
      require('leap').add_default_mappings()
    end }
    use { "ggandor/flit.nvim", after = 'leap.nvim', config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        labeled_modes = "v",
        multiline = true,
        opts = {}
      }
    end }
    use { "tpope/vim-unimpaired", event = 'BufRead' }

    -- work in neovim
    use { "ShiChenCong/trouble.nvim", requires = "kyazdani42/nvim-web-devicons",
      config = function() require('conf.trouble') end }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', event = 'BufRead',
      config = function() require('conf.diffview') end }
    use { "norcalli/nvim-colorizer.lua", event = 'BufRead', config = function() require('conf.csscolor') end }
    -- use { "kevinhwang91/nvim-bqf", event = 'InsertEnter',
    --   config = function() require('bqf').setup({ auto_enable = false, }) end }
    use { "windwp/nvim-ts-autotag", event = 'InsertEnter' }
    -- use { "mfussenegger/nvim-dap", keys = { '<leader>da' }, config = function() require('conf.dap') end }
    use { 'mhartington/formatter.nvim', event = 'BufRead', config = function() require('conf.formatter') end }
    use { 'https://gitlab.com/yorickpeterse/nvim-pqf.git', event = 'BufRead',
      config = function() require('pqf').setup() end }
    use { 'akinsho/git-conflict.nvim', event = 'BufRead', config = function()
      require('git-conflict').setup({ default_mappings = true, disable_diagnostics = false,
        highlights = { incoming = 'DiffText', current = 'DiffAdd', } })
    end }

    -- use { "akinsho/toggleterm.nvim", tag = 'v1.*', event = 'BufRead', config = function() require('conf.toggleterm') end }
    use { "mg979/vim-visual-multi", event = 'BufRead' }

    use { 'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim', 'trouble.nvim' }, },
      cmd = { "Telescope" }, keys = { '<leader>fw' }, config = function()
        require('conf.telescope')
      end }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'telescope.nvim', config = function()
      require('telescope').load_extension('fzf')
    end }
    use { 'nvim-telescope/telescope-ui-select.nvim', after = 'telescope.nvim', config = function()
      require("telescope").load_extension("ui-select")
    end }

    use { "lewis6991/gitsigns.nvim", event = 'BufReadPre', config = function() require('conf.gitsign') end }
    use { "tpope/vim-fugitive", cmd = 'Git' }

    use { 'kyazdani42/nvim-tree.lua', cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
      config = function() require('conf.nvim-tree') end }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
      require('conf.treesitter')
    end }

    use { "numToStr/Comment.nvim", after = { "nvim-treesitter", "nvim-ts-context-commentstring" },
      config = function() require('conf.comment') end }
    use { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'BufReadPre' }

    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', event = 'BufRead', config = function()
      require('conf.ufo')
    end }

    use { "neovim/nvim-lspconfig", config = function() require('lsp') end }

    use { "ThePrimeagen/harpoon", keys = { { 'n', '<C-e>' } }, config = function() require('conf.harpoon') end }

    use { 'mrshmllow/document-color.nvim',
      config = function() require("document-color").setup { mode = "background", } end, event = { 'BufReadPre' } }

    --------------------------------------------------非lazyload--------------------------------------------------------------------
    use({ "catppuccin/nvim", as = "catppuccin" })

    use { "Shougo/defx.nvim", requires = { "kristijanhusak/defx-git", "kristijanhusak/defx-icons" },
      config = function() require('conf.defx') end }

    use { "onsails/lspkind.nvim", module = { 'lspkind' } }

    use {
      { 'hrsh7th/nvim-cmp',
        config = function()
          require('conf.cmp')
        end,
        event = 'InsertEnter *'
      },
      { 'L3MON4D3/LuaSnip', config = function()
        require('conf.luasnip')
      end, module = { 'luasnip', 'LuaSnip' } },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', module_pattern = { 'cmp_nvim_lsp' } },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    }

    --[[ use {
      'rmagatti/auto-session',
      config = function()
        require('auto-session').setup {
          log_level = 'error',
          auto_session_suppress_dirs = { '~/', '~/Projects' }
        }
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
      end
    } ]]
    use { 'Shatur/neovim-session-manager', config = function()
      require('session_manager').setup({
        autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir
      })
    end }
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = function()
      require('conf.lualine')
    end }
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons', config = function()
      require('conf.bufferline')
    end }
    --[[ use {
      'AckslD/nvim-trevJ.lua',
      config = 'require("trevj").setup()', -- optional call for configurating non-default filetypes etc
      module = 'trevj',
      setup = function()
        vim.keymap.set('n', '<leader>j', function()
          require('trevj').format_at_cursor()
        end)
      end,
    } ]]

    use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
      require('conf.toggleterm')
    end, event = 'BufRead' }

    use { "tiagovla/scope.nvim", config = function() require("scope").setup() end }
    -- use { 'vimpostor/vim-tpipeline' }
    use { 'rainbowhxch/accelerated-jk.nvim', config = function()
      require('accelerated-jk').setup()
      vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', {})
      vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', {})
    end }

    -- use 'joechrisellis/lsp-format-modifications.nvim'
    use({
      'Wansmer/treesj',
      requires = { 'nvim-treesitter' },
      config = function()
        require('treesj').setup({
          use_default_keymaps = false,
        });
        vim.keymap.set('n', '<leader>j', ':TSJToggle<CR>', { silent = true })
      end,
      event = 'BufRead'
    })

    use { 'alexghergh/nvim-tmux-navigation', config = function()
      local nvim_tmux_nav = require('nvim-tmux-navigation')

      nvim_tmux_nav.setup {
        disable_when_zoomed = true -- defaults to false
      }

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      -- vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      -- vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end }

    use { 'simrat39/rust-tools.nvim', config = function()
      require('conf.rust-tool')
    end }
  end,
  config = {
    compile_path = compile_path,
    git = {
      default_url_format = 'https://hub.fastgit.org/%s',
      clone_timeout = 20
    },
  }
})
