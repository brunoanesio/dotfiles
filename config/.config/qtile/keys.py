from typing import List  # noqa: F401

from libqtile.config import Key
from libqtile.lazy import lazy

mod = "mod4"
terminal = "kitty -1"
browser = "firefox"
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([mod, "shift"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # More layout keys
    Key([mod], "o", lazy.layout.grow()),
    Key([mod], "i", lazy.layout.shrink()),
    Key([mod, "shift"], "m", lazy.layout.maximize()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "mod1"], "f", lazy.layout.flip()),
    # Toggle between split and unsplit sides of stack.
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # General Keybinds
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "shift"], "t", lazy.spawn("alacritty"), desc="Launch Alacritty"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "e", lazy.shutdown(), desc="Shutdown Qtile"),
    Key(
        [mod, "shift"], "x", lazy.spawn("betterlockscreen -l blur"), desc="Lock Screen"
    ),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Floating and fullscreen
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    # Rofi
    Key([mod], "d", lazy.spawn("rofi -modi drun,run,window -show drun")),
    Key([mod], "y", lazy.spawn("rofi -show emoji -modi emoji")),
    Key([mod], "c", lazy.spawn("rofi -show calc -modi calc -no-show-match -no-sort")),
    # Player controls
    Key([], "XF86AudioPlay", lazy.spawn("playerctl --player=playerctld play-pause")),
    Key([], "XF86AudioPause", lazy.spawn("playerctl --player=playerctld play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl --player=playerctld next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl --player=playerctld previous")),
    # Volume keys
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%"),
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%"),
    ),
    # Program shortcuts
    Key([mod], "e", lazy.spawn("thunar")),
    Key([mod], "b", lazy.spawn(browser)),
    Key([mod], "g", lazy.spawn("kitty -e ranger")),
    Key([], "Print", lazy.spawn("screenshot select")),
    Key([mod], "Print", lazy.spawn("screenshot")),
]
