return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	opts = {
		automatic_installation = true,
	},
  config = function()
    require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
    }
    end
}
