local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 25
config.font_size = 14
config.color_scheme = "carbonfox"
config.font = wezterm.font("FiraCode Nerd Font Mono", {
	weight = "Medium",
})
config.adjust_window_size_when_changing_font_size = false

-- Detect the platform and set default program for Windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "wsl.exe", "~" }
end

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- This will completely disable the WezTerm tab bar. We don't need it since we are using zellij for multiplexing.
config.enable_tab_bar = false

config.keys = config.keys or {}

-- Map Left Alt to behave as Meta
config.keys = {
	{
		key = "m",
		mods = "ALT",
		action = wezterm.action.SendString("cmatrix\n"),
	},
}

-- Finally, return the configuration to wezterm:
return config
