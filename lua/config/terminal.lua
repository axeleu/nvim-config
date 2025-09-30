local function set_terminal_hl()
    vim.api.nvim_set_hl(0, "Terminal", { bg = "#1e2230", fg = "#ffcb6b" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#5a607f"})
end

set_terminal_hl()

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        set_terminal_hl()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.api.nvim_win_set_option(0, "winhighlight", "Normal:Terminal,NormalNC:Terminal")
    end,
})
