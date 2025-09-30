return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      stages = "fade_in_slide_out",
      timeout = 3000,
      render = "default", -- or "minimal", "compact"
    })
  end,
}
