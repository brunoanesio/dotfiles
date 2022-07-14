from colors import catppuccin
from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy

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
