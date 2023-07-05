local status, which_key = pcall(require, "which-key")
if not status then
	return
end

which_key.setup({
	window = { border = "single" },
	icons = { group = "" },
})

local wk = require("which-key")

wk.register({
	f = { name = "File" },
	s = { name = "Window" },
	t = { name = "Tabs" },
	g = { name = "Git", { v = { name = "Diffview" } } },
	b = { name = "Buffer" },
	r = { name = "Typescript", { n = { name = "Rename Var" }, u = "Remove unused import" } },
	n = { name = "NPM Package Info" },
}, { prefix = "<leader>" })
