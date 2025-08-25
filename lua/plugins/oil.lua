return {
  'stevearc/oil.nvim',
  --- @module 'oil'
  --- @type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
    { "benomahony/oil-git.nvim",
      opts = {
        highlights = {
          OilGitAdded = { fg = "#a6e3a1" },     -- green
          OilGitModified = { fg = "#f9e2af" },  -- yellow  
          OilGitDeleted = { fg = "#f38ba8" },   -- red
          OilGitRenamed = { fg = "#cba6f7" },   -- purple
          OilGitUntracked = { fg = "#89b4fa" }, -- blue
          OilGitIgnored = { fg = "#6c7086" },   -- gray
        },
      },
    },
  },
  config = function()
    require("oil").setup({
      columns = {
        "icon",
      },
      buf_options = {
        buflisted = true,
        bufhidden = "hide",
      },
      -- win_options = {
      --   signcolumn = "yes:2",
      -- },
      view_options = {
        show_hidden = true,
      },
    })
  end,
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
