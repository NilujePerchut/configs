local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.enable_wayland = false
config.front_end = "WebGpu"

-- Font
config.font = wezterm.font "NotoMono Nerd Font Mono"
config.font_size = 20.0

config.color_scheme = "Darktooth (base16)"

-- UI
config.enable_tab_bar= false
config.enable_scroll_bar = true
config.audible_bell = "Disabled"

return config
