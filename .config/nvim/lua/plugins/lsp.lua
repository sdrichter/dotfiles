return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
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
