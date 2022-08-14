from colors import catppuccin
from libqtile import bar
from libqtile.config import Screen
from libqtile.lazy import lazy
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration

widget_defaults = dict(
    font="JetBrainsMonoMedium Nerd Font",
    fontsize=16,
    padding=6,
)
extension_defaults = widget_defaults.copy()

transparent = "#00000000"
decor = {
    "decorations": [
        RectDecoration(
            use_widget_background=True,
            radius=0,
            filled=True,
            padding_y=2,
        )
    ],
    "padding": 12,
}

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
                widget.CurrentLayoutIcon(scale=0.70, padding=2),
                widget.Prompt(),
                widget.WindowName(
                    max_chars=40,
                ),
                widget.Spacer(length=10),
                widget.CPU(
                    fmt=" {}",
                    format="{load_percent}%",
                    background=catppuccin["blue"],
                    foreground=catppuccin["bg"],
                    **decor,
                ),
                widget.Spacer(length=10),
                widget.Memory(
                    fmt=" {}",
                    format="{MemUsed:.2f}{mm}",
                    measure_mem="G",
                    background=catppuccin["magenta"],
                    foreground=catppuccin["bg"],
                    **decor,
                ),
                widget.Spacer(length=10),
                widget.PulseVolume(
                    fmt="墳 {}",
                    mouse_callbacks={"Button3": lazy.spawn("pavucontrol")},
                    update_interval=0.1,
                    background=catppuccin["cyan"],
                    foreground=catppuccin["bg"],
                    **decor,
                ),
                widget.Spacer(length=10),
                widget.Clock(
                    fmt=" {}",
                    format="%a, %d %b",
                    background=catppuccin["green"],
                    foreground=catppuccin["bg"],
                    **decor,
                ),
                widget.Spacer(length=10),
                widget.Clock(
                    fmt=" {}",
                    format="%H:%M",
                    background=catppuccin["yellow"],
                    foreground=catppuccin["bg"],
                    **decor,
                ),
                widget.Spacer(length=8),
                widget.Systray(
                    padding=8,
                ),
                widget.Spacer(length=15),
            ],
            # margin=[4, 4, 2, 4],
            # border_width=2,
            # border_color=catppuccin["blue"],
            size=30,
            background=catppuccin["bg"],
            foreground=catppuccin["fg"],
        ),
    ),
]
