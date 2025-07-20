return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = (not LazyVim.is_win())
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "/home/wavelet/customsideloads/friendly-snippets" },
      })
      require("luasnip.loaders.from_snipmate").lazy_load({
        paths = { "/home/wavelet/customsideloads/vim-snippets/snippets" },
      })
    end,
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
}
