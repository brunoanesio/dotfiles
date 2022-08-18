import os
import subprocess
from typing import List  # noqa: F401

from colors import catppuccin_mocha
from groups import groups
from keys import keys
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from screens import screens

mod = "mod4"
terminal = "kitty -1"

widget_defaults = dict(
    font="Iosevka Mayukai Codepro Medium",
    fontsize=17,
    padding=6,
)
extension_defaults = widget_defaults.copy()


def layout_theme():
    return {
        "border_width": 2,
        "margin": 4,
        "border_focus": catppuccin_mocha["blue"],
        "border_normal": catppuccin_mocha["black"],
    }


layouts = [
    layout.MonadTall(**layout_theme()),
    layout.Columns(
        border_focus=catppuccin_mocha["blue"],
        border_normal=catppuccin_mocha["black"],
        border_width=2,
    ),
    layout.Max(),
    layout.Bsp(border_on_single=True, **layout_theme()),
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
    border_focus=catppuccin_mocha["blue"],
    border_width=2,
)

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
auto_minimize = True
wmname = "qtile"
# wmname = "LG3D"

# Hooks


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])
