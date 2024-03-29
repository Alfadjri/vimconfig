local ensure_packer = function()
  local fn = vim.fn local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reload neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status , packer = pcall(require,"packer")
if not status then
  return
end
return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim") 
  use("bluz71/vim-nightfly-guicolors") --theme
  use("christoomey/vim-tmux-navigator") -- tmux & split windows navigator
  use("szw/vim-maximizer")
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")
  use("numToStr/Comment.nvim")
  use("nvim-tree/nvim-tree.lua")
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")
  use({"nvim-telescope/telescope-fzf-native.nvim",run = "make"})
  use({"nvim-telescope/telescope.nvim",branch = "0.1.x"})
  
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- managin & installing lsp server
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("lukas-reineke/lsp-format.nvim")
  
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("glepnir/lspsaga.nvim")
  use("jose-elias-alvarez/typescript.nvim")
  use("onsails/lspkind.nvim")
  use("jose-elias-alvarez/null-ls.nvim")

  use("jayp0521/mason-null-ls.nvim")
  -- background transparant
  use("xiyaowong/transparent.nvim")
  
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({with_sync = true})
    end,
  })

  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use("lewis6991/gitsigns.nvim")
  
  if packer_bootstrap then
    require("packer").sync()
  end
end)
