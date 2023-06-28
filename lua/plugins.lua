vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  -- colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
    "mcchrish/zenbones.nvim",
    requires = "rktjmp/lush.nvim",
  }
  use "savq/melange-nvim"
  use "folke/tokyonight.nvim"
  use "navarasu/onedark.nvim"
  use "EdenEast/nightfox.nvim"
  use "sainnhe/gruvbox-material"
  use "sainnhe/edge"

  use "nvim-lualine/lualine.nvim" -- Statusline
  use "nvim-lua/plenary.nvim" -- Common utilities
  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "stevearc/dressing.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "RRethy/vim-illuminate"

  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "saadparwaiz1/cmp_luasnip"

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  }

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "eandrju/cellular-automaton.nvim"
  use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/nvim-treesitter-context"
  use "kyazdani42/nvim-web-devicons" -- File icons
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "github/copilot.vim"
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope-live-grep-args.nvim" }
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "norcalli/nvim-colorizer.lua"
  use "akinsho/nvim-bufferline.lua"

  use "lewis6991/gitsigns.nvim"
  use "dinhhuy258/git.nvim" -- For git blame & browse
  use "numToStr/Comment.nvim"
  use "kylechui/nvim-surround"

  use "goolord/alpha-nvim"

  use {
    "ray-x/lsp_signature.nvim",
  }

  use "nvim-tree/nvim-web-devicons" -- OPTIONAL: for file icons
  use "lewis6991/gitsigns.nvim" -- OPTIONAL: for git status
  use "romgrk/barbar.nvim"

  use {
    "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  }
  use {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  use {
    "kosayoda/nvim-lightbulb",
    requires = "antoinemadec/FixCursorHold.nvim",
  }
end)
