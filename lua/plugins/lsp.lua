return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ts_ls = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")

			for server, config in pairs(opts.servers or {}) do
				-- 1. Apply configurations statically (replaces .setup)
				-- This merges defaults from nvim-lspconfig with your custom 'config'
				vim.lsp.config(server, config)

				-- 2. Enable the server so it auto-activates for its filetypes
				vim.lsp.enable(server)
			end

			-- 3. Modern way to handle LSP keymaps (replaces on_attach)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					-- Setup your keymaps here
					local opts = { buffer = args.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				end,
			})
		end,
	},
}
