local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font "NotoMono Nerd Font Mono"
config.font_size = 13.0

config.color_scheme = "Darktooth"

-- UI
config.enable_tab_bar= false
config.enable_scroll_bar = true

return config
