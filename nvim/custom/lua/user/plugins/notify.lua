local setup, notify = pcall(require, "notify")
if not setup then
	return
end

vim.notify = notify
