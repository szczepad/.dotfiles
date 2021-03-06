local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim when plugins.lua is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Functions used in a lot of plugins
  use "morhetz/gruvbox"
  use "windwp/nvim-autopairs"
  use {"numToStr/Comment.nvim", tag = 'v0.6'}
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use {"akinsho/bufferline.nvim", branch = 'main'}
  use {"akinsho/toggleterm.nvim", branch = 'main'}
  use "preservim/tagbar"
  use "moll/vim-bbye"

  -- LSP 
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"
  -- CMP plugins
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- Telescope
  use "BurntSushi/ripgrep"
  use "nvim-telescope/telescope.nvim" 

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git 
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"
  use "vim-airline/vim-airline"

  -- Golang
  use "fatih/vim-go"

  -- Automatically set up config after cloning packer
  -- This has to be at the end
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
