return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-nvim-dap.nvim",
            "mfussenegger/nvim-jdtls",
        },
        config = function()
            -- Setup Mason first
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "jdtls",
                    "clangd",
                    "ts_ls",
                    "eslint",
                    "mesonlsp",
                    "cmake",
                    "gopls",
                    "glsl_analyzer",
                    "pyright",
                },
            })

            -- Configure diagnostics
            vim.diagnostic.config({
                virtual_text = true,
            })

            -- Lua LSP configuration
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- Java LSP configuration
            vim.lsp.config("jdtls", {
                cmd = { "jdtls" },
                root_markers = { ".git", "mvnw", "gradlew", "pom.xml" },
                settings = {
                    java = {},
                },
            })

            -- C/C++ LSP configuration
            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=google",
                    "--header-insertion=never",
                    "--query-driver=*",
                },
                init_options = {
                    compilationDatabasePath = "build/debug", -- if you have compile_commands.json in a build folder
                },
            })

            vim.lsp.config("tsserver", {
                root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
                settings = {
                    typescript = {
                        preferences = { importModuleSpecifier = "relative" },
                    },
                    javascript = {
                        preferences = { importModuleSpecifier = "relative" },
                    },
                },
            })

            vim.lsp.config("eslint", {
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            })

            -- GLSL LSP configuration
            vim.lsp.config("glsl_analyzer", {
                filetypes = { "glsl", "vert", "tesc", "tese", "geom", "frag", "comp" },
            })

            -- Keymaps for LSP
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })

            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Sig help" })

            -- Apply Clangd Fix
            vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "LSP Code Action (Fix)" })

            -- lsp error list
            vim.keymap.set("n", "<leader>se", vim.diagnostic.setqflist, { desc = "Show lsp errors list" })
        end,
    },
}
