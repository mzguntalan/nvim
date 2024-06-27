-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- use({
  --  'projekt0n/github-nvim-theme',
  --  config = function()
  --   require('github-theme').setup({
  -- 	  -- ...
  --   })
  
  --   vim.cmd('colorscheme github_light')
  --  end
  -- })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  -- language
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  -- END language
  use('jose-elias-alvarez/null-ls.nvim')
  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use('ray-x/lsp_signature.nvim')
  use('terrortylor/nvim-comment')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/vim-vsnip')
  use('petertriho/cmp-git')
  use('onsails/lspkind.nvim')
  use('lewis6991/gitsigns.nvim')
  use('folke/tokyonight.nvim')
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      -- require("toggleterm").setup()
  end}
  use('xiyaowong/transparent.nvim')
  use('arnamak/stay-centered.nvim')
  use('preservim/vim-markdown')
  use('mzguntalan/scratchpad.nvim')
  -- use('sonph/onehalf')
  -- use('wuelnerdotexe/vim-enfocado')
  -- use('Mofiqul/adwaita.nvim')
  -- use('polirritmico/monokai-nightasty.nvim')
  -- use('nyoom-engineering/oxocarbon.nvim')
  -- use('sainnhe/edge')
  -- use('EdenEast/nightfox.nvim')
  -- use('miikanissi/modus-themes.nvim')
  -- use('gmr458/cold.nvim')
  
end)
