local status, modicator = pcall(require, "modicator")
if not status then
	return
end

modicator.setup({ show_warnings = true })
