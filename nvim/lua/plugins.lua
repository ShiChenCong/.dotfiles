local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
    { 'catppuccin/nvim',       name = 'catppuccin' },
    { "windwp/nvim-autopairs", config = function() require('conf.autopairs') end, event = "InsertEnter" },

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
        "ggandor/leap.nvim",
        config = function() require('leap').add_default_mappings() end,
        event = 'BufEnter',
        dependencies = {
            { "ggandor/flit.nvim", config = function()
              require('flit').setup {
                  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
                  labeled_modes = "v",
                  multiline = true,
                  opts = {}
              }
            end },
        }
    },
    { "tpope/vim-unimpaired",   event = 'BufEnter' },
    { "ShiChenCong/trouble.nvim", dependencies = "kyazdani42/nvim-web-devicons",
        config = function() require('conf.trouble') end, event = 'BufEnter' },
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim',
        config = function() require('conf.diffview') end, cmd = { 'DiffviewFileHistory', 'DiffviewOpen' } },
    { "norcalli/nvim-colorizer.lua", config = function() require('conf.csscolor') end,  event = 'BufEnter' },
    { "windwp/nvim-ts-autotag",      event = "BufEnter" },
    { 'mhartington/formatter.nvim',  config = function() require('conf.formatter') end, event = 'BufEnter' },
    -- { 'https://gitlab.com/yorickpeterse/nvim-pqf.git',
    --   config = function() require('pqf').setup() end },
    { 'akinsho/git-conflict.nvim', config = function()
      require('git-conflict').setup({
          default_mappings = true,
          disable_diagnostics = false,
          highlights = { incoming = 'DiffText', current = 'DiffAdd', }
      })
    end, event = 'BufEnter' },
    {
        "akinsho/toggleterm.nvim",
        event = 'BufRead',
        config = function() require('conf.toggleterm') end,
    },
    { "mg979/vim-visual-multi",  keys = { '<C-n>' } },

    { 'nvim-telescope/telescope.nvim',
        config = function()
          require('conf.telescope')
        end,
        cmd = { "Telescope" }, keys = { '<leader>fw' },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'trouble.nvim',
            -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', config = function()
            --   require('telescope').load_extension('fzf')
            -- end },
        }
    },
    { 'nvim-telescope/telescope-ui-select.nvim', config = function()
      require("telescope").load_extension("ui-select")
    end },

    { "lewis6991/gitsigns.nvim", config = function() require('conf.gitsign') end, event = 'BufEnter' },
    { "tpope/vim-fugitive",      cmd = 'Git' },

    { 'kyazdani42/nvim-tree.lua',
        config = function() require('conf.nvim-tree') end, cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' } },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = function()
      require('conf.treesitter')
    end },

    { "numToStr/Comment.nvim",
        config = function() require('conf.comment') end,
        event = 'BufEnter',
        dependencies = {
            { 'JoosepAlviste/nvim-ts-context-commentstring' },
        }
    },

    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', config = function()
      require('conf.ufo')
    end, event = 'BufEnter' },

    { "neovim/nvim-lspconfig", config = function() require('lsp') end },
    { "ThePrimeagen/harpoon",  config = function() require('conf.harpoon') end, keys = { "<C-e>" } },

    {
        "Shougo/defx.nvim",
        dependencies = {
            "kristijanhusak/defx-git", "kristijanhusak/defx-icons",
            { "onsails/lspkind.nvim" },
        },
        cmd = "Defx",
        config = function() require('conf.defx') end,
    },


    { 'hrsh7th/nvim-cmp',
        config = function()
          require('conf.cmp')
        end,
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip',        config = function() require('conf.luasnip') end },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
        }
    },

    { 'Shatur/neovim-session-manager', config = function()
      require('session_manager').setup({
          autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir
      })
    end },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function()
          require('conf.lualine')
        end },
    { 'akinsho/bufferline.nvim', version = "v2.*", dependencies = 'kyazdani42/nvim-web-devicons', config = function()
      require('conf.bufferline')
    end },
    -- { "akinsho/toggleterm.nvim", version = 'v2.*', config = function()
    --   require('conf.toggleterm')
    -- end, event = 'BufRead' },

    { "tiagovla/scope.nvim",     config = function() require("scope").setup() end },
    { 'rainbowhxch/accelerated-jk.nvim', config = function()
      require('accelerated-jk').setup()
      vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', {})
      vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', {})
    end, event = 'BufRead' },

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

    { 'alexghergh/nvim-tmux-navigation', config = function()
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
    end },

    { "williamboman/mason.nvim", config = function() require("mason").setup() end },
    { 'manzeloth/live-server',   keys = { ",r" } },
    -- { 'keaising/im-select.nvim', event = 'BufEnter', config = function()
    --   require('im_select').setup {
    --       default_im_select    = "com.apple.keylayout.ABC",
    --       disable_auto_restore = 0,
    --       default_command      = 'im-select'
    --   }
    -- end }
}, {
    defaults = {
        lazy = false
    }
})
