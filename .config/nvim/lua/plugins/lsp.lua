return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            pyright = {
              analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "standard",
              },
            },
          },
        },
      },
    },
  },
}
