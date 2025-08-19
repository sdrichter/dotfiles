return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        beancount = {
          opts = {
            journal_file = "~/plaintextaccounting/beancount/ledger/main.beancount",
          },
        },
      },
    },
  },
}
