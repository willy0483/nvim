return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            debug = true,
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style=file" },
                }),
                null_ls.builtins.formatting.black.with({
                    extra_args = { "--line-length=88" }, -- Default Black line length
                }),
            },
        })
        vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, {})
    end,
}
