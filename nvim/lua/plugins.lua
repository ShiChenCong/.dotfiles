local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local map = require('util.map')
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('theme')
    end
  },
  { "windwp/nvim-autopairs",  config = function() require('conf.autopairs') end, event = "InsertEnter" },

  ({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
      })
    end,
    event = 'BufEnter'
  }),
  { "svban/YankAssassin.vim", event = 'BufEnter' },

  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function() require('conf.trouble') end,
    event = 'BufEnter'
  },
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() require('conf.diffview') end,
    cmd = { 'DiffviewFileHistory', 'DiffviewOpen' }
  },
  { "norcalli/nvim-colorizer.lua", config = function() require('conf.csscolor') end,  event = 'BufEnter' },
  { "windwp/nvim-ts-autotag",      event = "BufEnter" },
  { 'mhartington/formatter.nvim',  config = function() require('conf.formatter') end, event = 'BufEnter' },
  {
    'akinsho/git-conflict.nvim',
    config = function()
      require('git-conflict').setup({
        default_mappings = true,
        disable_diagnostics = false,
        highlights = { incoming = 'DiffText', current = 'DiffAdd', }
      })
    end,
    event = 'BufEnter'
  },

  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('conf.telescope')
    end,
    cmd = { "Telescope" },
    keys = { '<leader>fw' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'trouble.nvim',
    }
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "akinsho/toggleterm.nvim",
    keys = { "<C-\\>" },
    config = function() require('conf.toggleterm') end,
  },

  { "lewis6991/gitsigns.nvim", config = function() require('conf.gitsign') end, event = 'BufEnter' },
  { "tpope/vim-fugitive",      cmd = 'Git' },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('conf.treesitter')
    end
  },

  {
    "numToStr/Comment.nvim",
    config = function() require('conf.comment') end,
    event = 'BufEnter',
    dependencies = {
      { 'JoosepAlviste/nvim-ts-context-commentstring' },
    }
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('conf.ufo')
    end,
    event = 'BufEnter'
  },

  { "neovim/nvim-lspconfig", config = function() require('lsp') end },
  { "ThePrimeagen/harpoon",  config = function() require('conf.harpoon') end, keys = { "<C-e>" } },
  { "onsails/lspkind.nvim" },

  -- {
  --   "Shougo/defx.nvim",
  --   dependencies = {
  --     "kristijanhusak/defx-git", "kristijanhusak/defx-icons",
  --     { "onsails/lspkind.nvim" },
  --   },
  --   keys = "fi",
  --   config = function() require('conf.defx') end,
  -- },


  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('conf.cmp')
    end,
    event = 'BufRead',
    dependencies = {
      { 'L3MON4D3/LuaSnip',        config = function() require('conf.luasnip') end },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
    }
  },

  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('conf.lualine')
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('conf.bufferline')
    end,
    after = "catppuccin"
  },
  {
    'rainbowhxch/accelerated-jk.nvim',
    config = function()
      require('accelerated-jk').setup()
      vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', {})
      vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', {})
    end,
    event = 'BufRead'
  },

  ({
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({
        _default_keymaps = false,
      });
      vim.keymap.set('n', '<leader>j', ':TSJToggle<CR>', { silent = true })
    end,
    event = 'BufRead'
  }),

  {
    'alexghergh/nvim-tmux-navigation',
    event = 'VeryLazy',
    config = function()
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
    end
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = 'rounded',
          height = 0.85
        }
      })
    end
  },
  {
    'j-hui/fidget.nvim',
    tag = "legacy",
    config = function()
      require "fidget".setup {}
    end
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      jump = {
        pos = 'end'
      },
      highlight = {
        backdrop = false
      },
      prompt = {
        enabled = false,
      },
      modes = {
        char = {
          enabled = false
        },
        search = {
          enabled = false
        }
      }
    },
    -- stylua: ignore
    keys = {
      { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "F", mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" }
    },
  },
  {
    "RRethy/vim-illuminate",
    event = 'VeryLazy',
    config = function()
      require('illuminate').configure({
        filetypes_denylist = {
          'harpoon',
          'fugitive',
          'Trouble',
          'mason',
          'lazy',
          'netrw',
          'qf',
          'gitcommit',
          'DiffviewFiles',
          'TelescopePrompt'
        },
      })
    end
  },
  -- {
  --   'kevinhwang91/nvim-bqf',
  --   config = function()
  --     require('bqf').setup({
  --       preview = {
  --         -- 设置preview window 透明度
  --         winblend = 0,
  --       },
  --     })
  --   end
  -- },
  -- {
  --   'junegunn/fzf',
  --   run = function()
  --     vim.fn['fzf#install']()
  --   end
  -- },
  -- {
  --   "itchyny/vim-qfedit"
  -- }
  {
    'vidocqh/auto-indent.nvim',
    opts = {},
    event = "InsertEnter"
  },
}, {
  defaults = {
    lazy = false
  }
})
