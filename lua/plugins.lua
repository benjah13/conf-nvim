vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- package manager i
  use "wbthomason/packer.nvim"

  -- colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use "folke/tokyonight.nvim"
  use "navarasu/onedark.nvim"
  use "EdenEast/nightfox.nvim"
  use "sainnhe/edge"
  use "tomasiser/vim-code-dark"
  use "lunarvim/darkplus.nvim"

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-live-grep-args.nvim"
  use "windwp/nvim-autopairs"

  -- alpha
  use "goolord/alpha-nvim"

  -- copilot
  use "github/copilot.vim"

  -- cmp
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "saadparwaiz1/cmp_luasnip"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }
  use "ray-x/lsp_signature.nvim"
  use {
    "kosayoda/nvim-lightbulb",
    requires = "antoinemadec/FixCursorHold.nvim",
  }
  use "VidocqH/lsp-lens.nvim"
  use "filipdutescu/renamer.nvim"

  -- editor structure
  use "m4xshen/hardtime.nvim"
  use "nvim-lua/plenary.nvim" -- Common utilities
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  }

  use "romgrk/barbar.nvim"
  use {
    "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  }
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  }
  use "nvim-lualine/lualine.nvim" -- Statusline
  use "stevearc/dressing.nvim"
  use "karb94/neoscroll.nvim"
  use "nvim-pack/nvim-spectre"

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/nvim-treesitter-context"

  -- git
  use "dinhhuy258/git.nvim" -- For git blame & browse
  use "lewis6991/gitsigns.nvim" -- OPTIONAL: for git status
  use {
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  -- code stuffs
  use "lukas-reineke/indent-blankline.nvim"
  use "numToStr/Comment.nvim"
  use "RRethy/vim-illuminate"
  use "windwp/nvim-ts-autotag"

  -- to keep ?
  use "norcalli/nvim-colorizer.lua"
end)
