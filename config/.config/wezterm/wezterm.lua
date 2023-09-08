local wezterm = require("wezterm")

local config = {
  front_end = "OpenGL",
  font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" }),
  font_size = 14,
  line_height = 1.0,
  underline_position = -4,
  underline_thickness = 2,
  cursor_thickness = 1,
  color_scheme = "Catppuccin Mocha",
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_background_opacity = 0.90,
  text_background_opacity = 1.0,
  enable_wayland = true,
  warn_about_missing_glyphs = false,
}

return config
