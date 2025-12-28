local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.enable_wayland = true
config.front_end = "WebGpu"

-- Font
config.font = wezterm.font "NotoMono Nerd Font Mono"
config.font_size = 20.0

config.color_scheme = "Darktooth (base16)"

-- UI
config.enable_tab_bar= false
config.enable_scroll_bar = true
config.audible_bell = "Disabled"

-- Keyboard handling for multiple layouts (FR/AZERTY and EN/QWERTY)
-- This ensures WezTerm properly handles key events when switching between layouts
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Use native keyboard handling for better layout switching support
config.use_ime = true

-- Enable better keyboard protocol support (handles modifiers correctly)
config.enable_kitty_keyboard = true

return config
