import os
import subprocess
from typing import List  # noqa: F401

from colors import catppuccin
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
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
    Key([mod, "shift"], "f", lazy.layout.toggle_floating()),
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
    Key([mod], "Print", lazy.spawn("screenshot.sh select")),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )


def layout_theme():
    return {
        "border_width": 2,
        "margin": 4,
        "border_focus": catppuccin["blue"],
        "border_normal": catppuccin["black"],
    }


layouts = [
    layout.MonadTall(**layout_theme()),
    layout.Columns(
        border_focus=catppuccin["blue"],
        border_normal=catppuccin["black"],
        border_width=2,
    ),
    layout.Max(),
    # layout.Tile(**layout_theme()),
    # layout.Zoomy(**layout_theme()),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="pinentry-gtk-2"),  # GPG key password entry
    ],
    border_focus=catppuccin["blue"],
    border_width=2,
)

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Medium",
    fontsize=16,
    padding=6,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(linewidth=0, padding=5),
                widget.GroupBox(
                    borderwidth=0,
                    active=catppuccin["fg"],
                    inactive=catppuccin["gray"],
                    disable_drag=True,
                    block_highlight_text_color=catppuccin["blue"],
                    highlight_color=catppuccin["bg"],
                    highlight_method="line",
                ),
                widget.Sep(foreground=catppuccin["gray"], padding=10),
                widget.Prompt(),
                widget.WindowName(
                    max_chars=40,
                ),
                widget.CurrentLayoutIcon(
                    scale=0.65,
                    padding=0,
                ),
                widget.CurrentLayout(
                    foreground=catppuccin["yellow"],
                ),
                # widget.Sep(
                #     foreground=onedark['gray'],
                #     padding=10
                # ),
                # widget.TextBox(
                #     text='ﮮ',
                #     foreground=onedark['yellow'],
                #     padding=8
                # ),
                # widget.CheckUpdates(
                #     custom_command='checkupdates',
                #     no_update_string='N/A Updates',
                #     update_interval=60,
                # ),
                widget.Sep(foreground=catppuccin["gray"], padding=10),
                widget.TextBox(text="", foreground=catppuccin["blue"]),
                widget.CPU(
                    format="{load_percent}%",
                ),
                widget.Sep(foreground=catppuccin["gray"], padding=10),
                widget.TextBox(text="", foreground=catppuccin["magenta"]),
                widget.Memory(format="{MemUsed:.2f}{mm}", measure_mem="G"),
                widget.Sep(foreground=catppuccin["gray"], padding=10),
                widget.TextBox(text="墳", foreground=catppuccin["cyan"]),
                widget.PulseVolume(
                    mouse_callbacks={"Button3": lazy.spawn("pavucontrol")},
                    update_interval=0.1,
                ),
                widget.Sep(foreground=catppuccin["gray"], padding=10),
                widget.TextBox(
                    # text='',
                    text=" ",
                    foreground=catppuccin["green"],
                ),
                widget.Clock(
                    # format="%H:%M",
                    format="%a %d %b, %H:%M",
                ),
                widget.Sep(foreground=catppuccin["gray"], padding=10),
                widget.Systray(
                    padding=10,
                ),
                widget.Spacer(length=10),
                widget.Sep(foreground=catppuccin["gray"], padding=10),
                widget.QuickExit(
                    default_text=" ",
                    foreground=catppuccin["red"],
                    padding=8,
                    fontsize=13,
                ),
            ],
            size=30,
            background=catppuccin["bg"],
            foreground=catppuccin["fg"],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

# Hooks


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])
