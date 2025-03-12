local servers = {
    {
        "lua_ls",
        {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    }
}

local function key_map(opts)
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "gK", "<cmd>lua vim.lsp.buf.singnature_help()<cr>", opts)

    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.keymap.set("n", "<leader>cc", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
    vim.keymap.set("n", "<leader>cC", "<cmd>lua vim.lsp.codelens.refresh()<cr>", opts)
    vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
end

local M = {
    {
        "williamboman/mason-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
        },
    },
    {
        "neovim/nvim-lspconfig",
        cmd = "LspInfo",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp", opts = {} },
        },
        init = function()
            vim.opt.signcolumn = "yes"
        end,
        config = function()
            for _, server in ipairs(servers) do
                require("lspconfig")[server[1]].setup(server[2] or {})
            end

            local lsp_defaults = require("lspconfig").util.default_config

            lsp_defaults.capabilities =
                vim.tbl_deep_extend("force",
                    lsp_defaults.capabilities,
                    require("cmp_nvim_lsp").default_capabilities()
                )

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }
                    key_map(opts)
                end,
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local cmp = require("cmp")
            return {
                sources = {
                    { name = "nvim_lsp" },
                },
                snippet = {
                    expand = function(args)
                        vim.snipped.expand(args.body)
                    end,
                },
            }
        end,
    },
}

return M
