return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup {
      api_key_cmd = "echo $OPENAI_API_KEY",
      openai_params = {
        model = "gpt-4o",
        frequency_penalty = 0,
        --presence_penalty - 0,
        max_tokens = 4096,
        temperature = 0.2,
        top_p = 0.1,
        n = 1,
      },
    }
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim", -- optional
    "nvim-telescope/telescope.nvim",
  },
}
