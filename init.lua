require("ThoDHa")

-- Installs lazy 
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Telescope
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {'nvim-lua/plenary.nvim'},
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  {
    'ThePrimeagen/harpoon',
    event = "VeryLazy",
  },

  'mbbill/undotree',

  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  'lewis6991/gitsigns.nvim',
  -- LSP Support
  {
    branch = 'v2.x',
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
  },

  -- This is for formatting 
  'jose-elias-alvarez/null-ls.nvim',

  -- This is for linting...
  --'mfussenegger/nvim-lint',

  -- This is for Debugging support and UI
  {
    'mfussenegger/nvim-dap',
    event = "VeryLazy",
    -- NOTE: And you can specify dependencies as well
    dependencies = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      'mfussenegger/nvim-dap-python',
      'mfussenegger/nvim-dap-vscode-js'
    },
  },
  'mfussenegger/nvim-jdtls',
  -- Status
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        { 'kyazdani42/nvim-web-devicons'},
    }
  },
  'rmagatti/auto-session',
  -- Color Schemes
  'navarasu/onedark.nvim',

  -- Does a popup of possible key maps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}, {})

  require('lualine').setup()
    require('onedark').setup {
      --  style = 'dark'
      -- style = 'darker'
      -- style = 'cool'
      style = 'deep'
      --  style = 'warm'
      -- style = 'warmer'
      -- style = 'light'
    }
     require('onedark').load()
  require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    }

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
