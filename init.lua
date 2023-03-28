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

  'ThePrimeagen/harpoon',
  'mbbill/undotree',

  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  'lewis6991/gitsigns.nvim',
  -- LSP Support
  {
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

  -- This is for linting...
  'mfussenegger/nvim-lint',

  -- This is for Debugging support and UI
  {
    'mfussenegger/nvim-dap',

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

  -- Status
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        { 'kyazdani42/nvim-web-devicons', opt = true },
    }
  },

  -- Color Schemes
  'navarasu/onedark.nvim'
  -- 'shaunsingh/nord.nvim'

}, {})
  require('lualine').setup()
  --vim.cmd[[colorscheme nord]]
  --  use 'martinsione/darkplus.nvim',
  --  use ({
    --    'rose-pine/neovim',
    --    as = 'rose-pine',
    --    config = function()
      --      vim.cmd('colorscheme rose-pine')
      --    end
      --  })
    -- Lua
    --
    require('onedark').setup {
      --  style = 'dark'
      -- style = 'darker'
      -- style = 'cool'
      style = 'deep'
      --  style = 'warm'
      -- style = 'warmer'
    }
     require('onedark').load()
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
