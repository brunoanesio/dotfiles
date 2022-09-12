from colors import catppuccin_mocha
from libqtile import bar
from libqtile.config import Screen
from libqtile.lazy import lazy
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration

decor = {
    "decorations": [
        RectDecoration(
            colour=catppuccin_mocha["black"],
            radius=8,
            filled=True,
            padding_y=2,
            group=True,
        )
    ],
    "padding": 8,
}

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(linewidth=0, padding=5),
                widget.GroupBox(
                    borderwidth=2,
                    active=catppuccin_mocha["fg"],
                    inactive=catppuccin_mocha["gray"],
                    block_highlight_text_color=catppuccin_mocha["blue"],
                    highlight_color=catppuccin_mocha["black"],
                    this_current_screen_border=catppuccin_mocha["blue"],
                    this_screen_border=catppuccin_mocha["gray"],
                    urgent_border=catppuccin_mocha["red"],
                    highlight_method="text",
                    hide_unused=False,
                    disable_drag=True,
                    fontsize=12,
                    **decor
                ),
                widget.Prompt(),
                widget.Spacer(length=10),
                widget.WindowName(
                    max_chars=50, empty_group_string=" Desktop", **decor
                ),
                widget.Spacer(length=10),
                widget.CurrentLayout(foreground=catppuccin_mocha["lavender"], **decor),
                widget.CPU(
                    fmt=" {}",
                    format="{load_percent}%",
                    foreground=catppuccin_mocha["blue"],
                    **decor
                ),
                widget.Memory(
                    fmt=" {}",
                    format="{MemUsed:.2f}{mm}",
                    measure_mem="G",
                    foreground=catppuccin_mocha["magenta"],
                    **decor
                ),
                widget.Spacer(length=10),
                widget.PulseVolume(
                    fmt="墳 {}",
                    mouse_callbacks={"Button3": lazy.spawn("pavucontrol")},
                    update_interval=0.1,
                    foreground=catppuccin_mocha["cyan"],
                    **decor
                ),
                widget.Spacer(length=10),
                widget.Clock(
                    fmt=" {}",
                    format="%a, %d %b",
                    foreground=catppuccin_mocha["green"],
                    **decor
                ),
                widget.Clock(
                    fmt=" {}",
                    format="%H:%M",
                    foreground=catppuccin_mocha["yellow"],
                    **decor
                ),
                widget.Spacer(length=4),
                widget.Systray(
                    padding=8,
                ),
                widget.Spacer(length=10),
            ],
            # margin=[4, 4, 2, 4],
            # border_width=2,
            # border_color=catppuccin["blue"],
            size=32,
            background=catppuccin_mocha["bg"],
            foreground=catppuccin_mocha["fg"],
        ),
    ),
]
