return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      plugins = {
        presets = {
          operators = false,
          motions = false,
        },
      },
    })
  end,
}

