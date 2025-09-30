return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "pylsp",
            },
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- Lua lsp
            lspconfig.lua_ls.setup({ capabilities = capabilities })

            -- Python lsp
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            pylint = { enabled = true },
                            pylsp_mypy = { enabled = true, live_mode = false },
                            pycodestyle = { enabled = false },
                        },
                    },
                },
            })

            -- Set some useful keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "(K) Vet inte vad den gör" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "(g)oto (d)efinition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "(g)oto (r)eferences" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "(c)ode (a)ction" })
        end,
    },
}
