local wezterm = require("wezterm")

local config = wezterm.config_builder()
config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	check_for_updates = false,
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 12,
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},
	color_scheme = "gruvbox_material_dark_hard",
	color_schemes = {
		["gruvbox_material_dark_hard"] = {
			foreground = "#D4BE98",
			background = "#1D2021",
			cursor_bg = "#D4BE98",
			cursor_border = "#D4BE98",
			cursor_fg = "#1D2021",
			selection_bg = "#D4BE98",
			selection_fg = "#3C3836",

			ansi = {
				"#1d2021",
				"#ea6962",
				"#a9b665",
				"#d8a657",
				"#7daea3",
				"#d3869b",
				"#89b482",
				"#d4be98",
			},
			brights = {
				"#eddeb5",
				"#ea6962",
				"#a9b665",
				"#d8a657",
				"#7daea3",
				"#d3869b",
				"#89b482",
				"#d4be98",
			},
		},
	},
}
return config
