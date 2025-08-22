return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts = {
      sources = {
        default = { "avante", "lsp", "path", "snippets", "buffer" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {
              -- options for blink-cmp-avante
            },
          },
        },
      },
    },
  },
  {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- for example
      provider = "copilot",
      -- behaviour = {
      --   enable_fastapply = true,
      -- },
      -- providers = {
      --   morph = {
      --     model = "morph-v3-fast",
      --   },
      -- },
      -- rag_service = {
      --   enabled = true,
      --   host_mount = os.getenv("HOME"),
      --   runner = "docker",
      --   llm = {
      --     provider = "ollama",
      --     endpoint = "http://localhost:11434",
      --     model = "gemma3:27b-it-q4_K_M",
      --   },
      --   embed = {
      --     provider = "ollama",
      --     endpoint = "http://localhost:11434",
      --     model = "nomic-embed-text",
      --     extra = {
      --       embed_batch_size = 10,
      --     },
      --   },
      -- },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "folke/snacks.nvim", -- for input provider snacks
      "echasnovski/mini.icons",
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
