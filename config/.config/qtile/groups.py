from keys import keys
from libqtile.config import DropDown, Group, Key, Match, ScratchPad
from libqtile.lazy import lazy

mod = "mod4"
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

# Scratchpads
groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown("term", "kitty", width=0.7, height=0.6, x=0.150, y=0.2),
            DropDown("nvim", "kitty -e nvim", width=0.7, height=0.6, x=0.150, y=0.2),
            DropDown("nnn", "kitty -e nnn", width=0.7, height=0.6, x=0.150, y=0.2),
        ],
    )
)
keys.extend(
    [
        Key([mod, "control"], "1", lazy.group["scratchpad"].dropdown_toggle("term")),
        Key([mod, "control"], "2", lazy.group["scratchpad"].dropdown_toggle("nvim")),
        Key([mod, "control"], "3", lazy.group["scratchpad"].dropdown_toggle("nnn")),
    ]
)
