return {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
        ui = {
            mode = "nui",
            nui_opts = {
                border = {
                    style = "rounded",
                },
                position = "50%", -- center
                size = { width = 60, height = "auto" },
            },
        },
        -- you can also configure other options:
        hint = true,
        notification = true,
        timeout = 3000,
    },
    config = function(_, opts)
        require("hardtime").setup(opts)
    end,
}
