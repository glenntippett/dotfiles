local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	ui = { border = "single" },
})

-- Install language servers
mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"terraformls",
	},
	-- auto-install configured servers (with lspconfig)
	automatics_installation = true, -- not the same as ensure_installed
})

-- Tools that don't have a language server (formatters and linters)
mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
		"tflint",
		"sonarlint-language-server",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
