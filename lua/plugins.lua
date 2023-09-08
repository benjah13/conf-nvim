local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end


vim.opt.rtp:prepend(lazypath)


return require("lazy").setup({
  -- colorschemes
   { "catppuccin/nvim", as = "catppuccin" },
   "folke/tokyonight.nvim",
   "navarasu/onedark.nvim",
   "EdenEast/nightfox.nvim",
   "sainnhe/edge",
   "tomasiser/vim-code-dark",
   "lunarvim/darkplus.nvim",

  -- telescope
   "nvim-telescope/telescope.nvim",
   "nvim-telescope/telescope-file-browser.nvim",
   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
   "nvim-telescope/telescope-ui-select.nvim",
   "nvim-telescope/telescope-live-grep-args.nvim",
  "windwp/nvim-autopairs",

  -- alpha
   "goolord/alpha-nvim",

  -- copilot
   "github/copilot.vim",

  -- cmp
   "hrsh7th/cmp-nvim-lsp",
   "hrsh7th/cmp-buffer",
   "hrsh7th/cmp-path",
   "hrsh7th/cmp-cmdline",
   "hrsh7th/nvim-cmp",
   "saadparwaiz1/cmp_luasnip",

  -- lsp
  "neovim/nvim-lspconfig",
   "onsails/lspkind-nvim", -- vscode-like pictograms
   "williamboman/mason.nvim",
   "williamboman/mason-lspconfig.nvim",
   { "L3MON4D3/LuaSnip", run = "make install_jsregexp" },
   "ray-x/lsp_signature.nvim",
   {
    "kosayoda/nvim-lightbulb",
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
  },
   "VidocqH/lsp-lens.nvim",
   "filipdutescu/renamer.nvim",

  -- editor structure
   "m4xshen/hardtime.nvim",
   "nvim-lua/plenary.nvim" ,-- Common utilities
   {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },

   "romgrk/barbar.nvim",
   {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
   {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
   "nvim-lualine/lualine.nvim", -- Statusline
   "stevearc/dressing.nvim",
   "karb94/neoscroll.nvim",
   "nvim-pack/nvim-spectre",

  -- treesitter
   {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
   "nvim-treesitter/nvim-treesitter-context",

  -- git
   "dinhhuy258/git.nvim", -- For git blame & browse
   "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
   {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- code stuffs
   "lukas-reineke/indent-blankline.nvim",
   "numToStr/Comment.nvim",
   "RRethy/vim-illuminate",
  "windwp/nvim-ts-autotag",

  -- to keep ?
  "norcalli/nvim-colorizer.lua"
})
