local setup, package_info = pcall(require, "package-info")
if not setup then
	return
end

vim.keymap.set(
	{ "n" },
	"<LEADER>ns",
	require("package-info").show,
	{ desc = "Show dependency versions", silent = true, noremap = true }
)

vim.keymap.set(
	{ "n" },
	"<LEADER>nc",
	require("package-info").hide,
	{ desc = "Hide dependency versions", silent = true, noremap = true }
)

vim.keymap.set(
	{ "n" },
	"<LEADER>nt",
	require("package-info").toggle,
	{ desc = "Toggle dependency versions", silent = true, noremap = true }
)

vim.keymap.set(
	{ "n" },
	"<LEADER>nu",
	require("package-info").update,
	{ desc = "Update dependency on the line", silent = true, noremap = true }
)

vim.keymap.set(
	{ "n" },
	"<LEADER>nd",
	require("package-info").delete,
	{ desc = "Delete dependency on the line", silent = true, noremap = true }
)

vim.keymap.set(
	{ "n" },
	"<LEADER>ni",
	require("package-info").install,
	{ desc = "Install a new dependency", silent = true, noremap = true }
)

vim.keymap.set(
	{ "n" },
	"<LEADER>np",
	require("package-info").change_version,
	{ desc = "Install a different dependency version", silent = true, noremap = true }
)

package_info.setup()
