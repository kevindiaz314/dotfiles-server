return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
  opts = {
    provider = "copilot",
    copilot = {
      model = "claude-3.7-sonnet",
    },
    windows = {
      width = 40,
      input = {
        prefix = " ",
        height = 15,
      },
    },
  },
  keys = {
    {"<space>aC", "<cmd>AvanteClear<cr>", desc = "avante: clear"}
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
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
          -- use_absolute_path = true,
        },
      },
    },
  },
}
