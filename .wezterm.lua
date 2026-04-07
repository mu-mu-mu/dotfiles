local wezterm = require 'wezterm'

return {
  front_end = "Software",
  font = wezterm.font("Monospace"),
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
}
