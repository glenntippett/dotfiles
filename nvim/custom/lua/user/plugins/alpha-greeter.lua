local setup_alpha, alpha = pcall(require, "alpha")
if not setup_alpha then
	return
end

local setup_theme, theme = pcall(require, "alpha.themes.dashboard")
if not setup_theme then
	return
end

theme.section.header.val = {
	[[    ⠀⠀⠀⠀⠀⠀⣀⠤⣒⣊⣭⠭⠉⠉⠑⠒⠢⠤⣀⠀⠀⠀⠀⠀⠀     ]],
	[[    ⠀⠀⠀⠀⢠⢊⡵⣪⡿⠋⠀⠀⠀⠀⠀⠀⠀⠁⠪⣝⢦⠀⠀⠀⠀⠀    ]],
	[[    ⠀⠀⠀⢠⠃⣾⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄⢣⠀⠀⠀⠀    ]],
	[[    ⠀⠀⠀⣾⠰⣿⣿⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⢸⡄⠀⠀⠀    ]],
	[[    ⠀⠀⢀⣿⢠⣿⣿⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡇⣼⣇⠀⠀⠀    ]],
	[[    ⠀⠀⢿⣿⡿⣿⣿⣿⣷⣶⣶⣶⣶⣶⣆⣀⣀⣀⣹⣿⡿⣿⢿⠀⠀⠀    ]],
	[[    ⠀⢀⣯⣿⣧⣿⣿⣿⣿⠿⣋⣥⠖⠢⢌⠙⢿⣶⣼⣿⢁⢸⣾⡧⠀⠀    ]],
	[[    ⠀⠈⢿⢹⣶⣉⡉⠩⠰⣾⠏⠀⠀⠀⠀⠈⠂⠌⢉⣡⣾⢠⢽⣧⣄⠀    ]],
	[[    ⠀⢀⠞⠹⣿⠃⠀⠀⣸⠇⠀⢀⣤⣤⣀⠀⠀⠀⠀⠘⣿⠀⠢⡙⢿⣧    ]],
	[[    ⣰⣃⠤⣿⣌⢀⠀⠀⢸⣤⣾⠿⠿⠿⠿⣿⣦⡀⠀⢀⠏⢁⡴⠊⡂⣿    ]],
	[[    ⣿⡇⠐⢝⠿⣿⡯⠲⢿⣿⣿⡏⠀⠀⠀⠀⠉⠛⠂⠌⠰⡿⠁⣠⣿⠇    ]],
	[[    ⠹⣿⣤⣶⡏⠀⠈⠐⡀⢻⣿⠤⠤⠀⡀⠀⠀⡠⠀⠀⠀⢐⣴⡿⠋⠀    ]],
	[[    ⠀⠹⣿⠻⣇⠠⢂⣐⡳⠤⢣⢰⣾⣦⢸⣖⠄⣐⣀⡒⢄⢠⣸⠁⠀⠀    ]],
	[[    ⠀⠀⠈⢶⣄⠄⢯⣈⣻⡇⠸⣿⣿⣿⡷⠀⣻⣉⠿⠿⢘⣨⠇⠀⠀⠀    ]],
	[[    ⠀⠀⠀⠀⠑⠠⢀⣀⣀⠤⠞⠉⠉⠙⠓⠤⣦⣀⣀⠤⠞⠁⠀⠀⠀⠀    ]],
}

theme.section.buttons.val = {
	theme.button("P", "  PackerSync", ":PackerSync <CR>"),
	theme.button("M", "  Mason", ":Mason <CR>"),
}

alpha.setup(theme.config)
