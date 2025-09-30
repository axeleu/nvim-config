return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local comments = require("todo-comments")
        comments.setup({
            keywords = {
                FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = " ", color = "info" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            },
        })
    end,
}
