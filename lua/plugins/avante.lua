return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    -- Set OpenAI as the default provider
    provider = "copilot",
    providers = {
      -- Default provider is OpenAI
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt5-mini",
        max_tokens = 120000,
      },
      ---@type AvanteProvider
      ["geai"] = {
        __inherited_from = 'openai',
        endpoint = vim.env.GEAI_ENDPOINT,
        model = "saia:agent:test",
        max_tokens = 120000,
        api_key_name = "GEAI_API_KEY",
      },
    },
  },
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",  -- for file_selector provider mini.pick
    "hrsh7th/nvim-cmp",       -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",       -- for file_selector provider fzf
    "stevearc/dressing.nvim",
    "echasnovski/mini.icons", -- or echasnovski/mini.icons
    -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = false,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
