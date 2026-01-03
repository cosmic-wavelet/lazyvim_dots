return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "/home/wavelet/customsideloads/friendly-snippets" },
      })
      require("luasnip.loaders.from_snipmate").lazy_load({
        paths = {
          "/home/wavelet/customsideloads/vim-snippets/snippets",
        },
      })
      return opts
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
}
