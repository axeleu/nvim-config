return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            debug = true,
            timeout = 10000,
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.sqlfluff,
            },
        })

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN]  = " ",
                    [vim.diagnostic.severity.HINT]  = " ",
                    [vim.diagnostic.severity.INFO]  = " ",
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                    [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
                    [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
                    [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
                },
                linehl = {},
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "(c)ode (f)ormat" })
        vim.keymap.set("n", "<leader>d", function()
            vim.diagnostic.open_float(nil, { focus = false })
        end, { desc = "(d)iagnostics" })
    end,
}
