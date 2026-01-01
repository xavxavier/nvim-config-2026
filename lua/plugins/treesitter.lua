return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      -- You MUST have parsers installed for highlighting to work
      ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "python",
          "c",
          "cpp",
          "bash",
          "json",
          "html",
          "css",
        },


      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
    },
  },
}
