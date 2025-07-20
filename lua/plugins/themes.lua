return {
  { "EdenEast/nightfox.nvim" },
  { "eldritch-theme/eldritch.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "sainnhe/sonokai" },
  { "navarasu/onedark.nvim" },
  {
    "brenoprata10/nvim-highlight-colors",
    init = function()
      require("nvim-highlight-colors").setup({})
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
  { "nvim-telescope/telescope-symbols.nvim" },
}
