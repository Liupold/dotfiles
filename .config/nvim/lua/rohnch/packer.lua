vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                          , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  --use 'tanvirtin/monokai.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'mbbill/undotree'
  use 'ThePrimeagen/vim-be-good'
  use 'tpope/vim-fugitive'
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
          {'neovim/nvim-lspconfig'},
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
  }

  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'CRAG666/code_runner.nvim'
end)
