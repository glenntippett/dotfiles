local status, which_key = pcall(require, "which-key")
if not status then
	return
end

which_key.setup({})

local wk = require("which-key")

wk.register({
	f = { name = "File" },
	s = { name = "Window" },
	t = { name = "Tabs" },
	g = { name = "Git" },
}, { prefix = "<leader>" })
