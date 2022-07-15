from typing import List  # noqa: F401

from libqtile.config import Key
from libqtile.lazy import lazy

mod = "mod4"
terminal = "kitty -1"
keys = [
    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"],
        "Left",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "Right",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "e", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Monad layout keys
    Key([mod], "h", lazy.layout.grow()),
    Key([mod], "l", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "m", lazy.layout.maximize()),
    # Floating and fullscreen
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    # Rofi
    Key([mod], "d", lazy.spawn("rofi -modi drun,run -show drun")),
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
    Key([mod], "b", lazy.spawn("firefox")),
    Key([mod], "g", lazy.spawn("kitty ranger")),
    Key([], "Print", lazy.spawn("screenshot select")),
    Key([mod], "Print", lazy.spawn("screenshot")),
]
