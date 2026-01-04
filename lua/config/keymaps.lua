vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Toggle undoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Lsp_signature
vim.keymap.set({ "n" }, "<C-k>", function()
    require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- neo tree toggle
vim.keymap.set("n", "<C-b>", "<Cmd>Neotree toggle<CR>")

