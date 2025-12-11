return{

    {
        "datsfilipe/vesper.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("vesper")
            vim.cmd('hi Directory guibg=NONE')
            vim.cmd('hi SignColumn guibg=NONE')
        end
    }

}
