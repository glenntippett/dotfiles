return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			solargraph = {
				filetypes = { "ruby", "eruby", "erb", "rb" },
				init_options = {
					formatting = true,
				},
				settings = {
					solargraph = {
						diagnostics = true,
						completion = true,
					},
				},
			},
		},
	},
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		-- Mason must be loaded before its dependents so we need to set it up here.
		-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },

		-- Allows extra capabilities provided by nvim-cmp
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.lsp.enable("solargraph")
		-- This might break something...
		require("lspconfig").ruby_lsp.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN } },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
				linehl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticError",
					[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticHint",
				},
			},
			virtual_text = {
				source = true,
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = string.format("Err: %s", diagnostic.message),
						[vim.diagnostic.severity.WARN] = string.format("Warn: %s", diagnostic.message),
						[vim.diagnostic.severity.INFO] = string.format("Info: %s", diagnostic.message),
						[vim.diagnostic.severity.HINT] = string.format("Hint: %s", diagnostic.message),
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		vim.keymap.set("n", "<leader>sD", function()
			local new_config = not vim.diagnostic.config().virtual_lines
			vim.diagnostic.config({ virtual_lines = new_config })
		end, { desc = "Toggle diagnostic virtual_lines" })

		-- underline diagnostic errors and warnings

		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP specification.
		--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. Available keys are:
		--  - cmd (table): Override the default command used to start the server
		--  - filetypes (table): Override the default list of associated filetypes for the server
		--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--  - settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		local servers = {
			terraformls = {
				filetypes = { "hcl", "tf", "tfvars" },
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			rubocop = {
				filetypes = { "ruby", "eruby", "erb", "rb" },
				init_options = {
					formatting = true,
				},
				settings = {
					rubocop = {
						diagnostics = true,
						completion = true,
					},
				},
			},
		}
		-- You can add other tools here that you want Mason to install
		-- for you, so that they are available from within Neovim.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
			"shfmt",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup({
			ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
			automatic_installation = true,
			automatic_enable = true,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for ts_ls)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
