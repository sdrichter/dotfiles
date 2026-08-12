return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "LSP[taplo] on_error" },
          opts = { skip = true },
        },
        {
          filter = { event = "notify", find = "No callback found for server response id 0" },
          opts = { skip = true },
        },
        {
          filter = { event = "notify", find = "ExperimentalWarning: SQLite is an experimental feature" },
          opts = { skip = true },
        },
        {
          filter = { event = "msg_show", find = "No callback found for server response id 0" },
          opts = { skip = true },
        },
      },
    },
  },
}
