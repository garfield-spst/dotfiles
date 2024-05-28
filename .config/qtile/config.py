import os
import subprocess
from libqtile import bar, hook, extension, layout, qtile
from libqtile.config import Group, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.config import EzKey as KeyZ, Key, KeyChord, Click, Drag
from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration

# from qtile_extras.widget import StatusNotifier
import colors

# Variables
modifier_keys = {
    "M": "mod4",
    "A": "mod1",
    "S": "shift",
    "C": "control",
}
myTerm = "alacritty"
myBrowser = "brave"
mod = "mod4"

# KeyMaps
keys = [
    KeyZ("M-q", lazy.window.kill(), desc="Kill focused window"),
    KeyZ("M-S-r", lazy.reload_config(), desc="Reload the config"),
    KeyZ("M-S-b", lazy.hide_show_bar(), desc="Hides the bar"),
    KeyZ("M-<Return>", lazy.spawn(myTerm), desc="Terminal"),
    KeyZ("M-b", lazy.spawn(myBrowser), desc="Web Browser"),
    KeyZ("M-<Space>", lazy.next_layout(), desc="Toggle between layouts"),
    KeyZ("M-<Tab>", lazy.screen.toggle_group(), desc="Move to the last visited group"),
    KeyZ("M-S-w", lazy.spawn("sh /home/sp/.config/scripts/wall.sh"), desc="Change Wallpaper"),
    KeyZ(
        "M-r",
        lazy.run_extension(
            extension.Dmenu(
                dmenu_prompt="  ",
                dmenu_command="dmenu_run",
                dmenu_font="JetBrainsMono-18",
                background="#272E33",
                foreground="#D5C9AB",
                selected_foreground="#272E33",
                selected_background="#D5C9AB",
                dmenu_height=30,
                dmenu_lines=10,
            )
        ),
    ),
    KeyZ(
        "M-w",
        lazy.run_extension(
            extension.WindowList(
                dmenu_prompt="  ",
                dmenu_font="JetBrainsMono-18",
                background="#272E33",
                foreground="#D5C9AB",
                selected_foreground="#272E33",
                selected_background="#D5C9AB",
                dmenu_height=20,
                dmenu_lines=20,
                item_format="{group}{window}",
            )
        ),
    ),
    KeyZ("M-h", lazy.layout.left(), desc="Move focus to left"),
    KeyZ("M-l", lazy.layout.right(), desc="Move focus to right"),
    KeyZ("M-j", lazy.layout.down(), desc="Move focus down"),
    KeyZ("M-k", lazy.layout.up(), desc="Move focus up"),
    KeyZ("C-<Tab>", lazy.layout.next(), desc="Move window focus to other window"),
    KeyZ(
        "M-S-h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    KeyZ(
        "M-S-l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    KeyZ(
        "M-S-j",
        lazy.layout.shuffle_down(),
        desc="Move window down",
    ),
    KeyZ(
        "M-S-k",
        lazy.layout.shuffle_up(),
        desc="Move window downup",
    ),
    KeyZ("M-C-h", lazy.layout.grow_left(), desc="Grow window to the left"),
    KeyZ("M-C-l", lazy.layout.grow_right(), desc="Grow window to the right"),
    KeyZ("M-C-j", lazy.layout.grow_down(), desc="Grow window down"),
    KeyZ("M-C-k", lazy.layout.grow_up(), desc="Grow window up"),
    KeyZ(
        "M-<minus>",
        lazy.layout.decrease_ratio(),
        lazy.layout.shrink().when(layout=["monadtall", "monadwide"]),
        desc="Grow window up",
    ),
    KeyZ(
        "M-<equal>",
        lazy.layout.increase_ratio(),
        lazy.layout.grow().when(layout=["monadtall", "monadwide"]),
        desc="Grow window up",
    ),
    KeyZ("M-n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # KeyZ("M-t", lazy.window.toggle_floating(), desc="toggle floating"),
    KeyZ(
        "M-f",
        lazy.window.toggle_fullscreen(),
        desc="toggle fullscreen",
    ),
    Key([], "F2", lazy.spawn("playerctl play-pause"), desc="Play Pause media"),
    Key([], "F11", lazy.spawn("pamixer -ud 5"), desc="Decrease volume"),
    Key([], "F12", lazy.spawn("pamixer -ui 5"), desc="Increase volume"),
    KeyChord(
        [mod],
        "d",
        [
            Key([], "t", lazy.spawn("sh ~/.local/bin/tmux-windows"), desc="List all dmscripts"),
            Key([], "a", lazy.spawn("dm-sounds -r"), desc="Choose ambient sound"),
            Key([], "b", lazy.spawn("dm-setbg -r"), desc="Set background"),
            Key([], "c", lazy.spawn("dtos-colorscheme -r"), desc="Choose color scheme"),
            Key(
                [],
                "e",
                lazy.spawn("dm-confedit -r"),
                desc="Choose a config file to edit",
            ),
            Key([], "i", lazy.spawn("dm-maim -r"), desc="Take a screenshot"),
            Key([], "k", lazy.spawn("dm-kill -r"), desc="Kill processes "),
            Key([], "m", lazy.spawn("dm-man -r"), desc="View manpages"),
            Key([], "n", lazy.spawn("dm-note -r"), desc="Store and copy notes"),
            Key([], "o", lazy.spawn("dm-bookman -r"), desc="Browser bookmarks"),
            Key([], "p", lazy.spawn("rofi-pass"), desc="Logout menu"),
            Key([], "q", lazy.spawn("dm-logout -r"), desc="Logout menu"),
            Key([], "r", lazy.spawn("dm-radio -r"), desc="Listen to online radio"),
            Key([], "s", lazy.spawn("dm-websearch -r"), desc="Search various engines"),
            Key([], "t", lazy.spawn("dm-translate -r"), desc="Translate text"),
        ],
    ),
    KeyChord(
        [mod],
        "s",
        [
            Key([], "1", lazy.group["scratchpad"].dropdown_toggle("term")),
            Key([], "2", lazy.group["scratchpad"].dropdown_toggle("term2")),
            Key([], "3", lazy.group["scratchpad"].dropdown_toggle("term3")),
            Key([], "y", lazy.group["scratchpad"].dropdown_toggle("yazi")),
            Key([], "b", lazy.group["scratchpad"].dropdown_toggle("qute")),
        ],
    ),
    KeyChord(
        [mod],
        "t",
        [
            Key([], "s", lazy.group["scratchpad"].dropdown_toggle("tmux-script")),
            # Key([], "w", lazy.spawn("sh ~/.config/scripts/wall.sh"), desc="Change Wallpaper"),
            # Key([], "r", lazy.spawn("sh ~/.config/scripts/wall.sh"), desc="Change Wallpaper"),
        ],
    ),
    KeyChord(
        [mod],
        "p",
        [
            Key(
                [],
                "s",
                lazy.spawn(
                    "qtile cmd-obj -o widget pomodoro -f eval -a 'self.update(self.toggle_active())'"
                ),
            ),
            Key(
                [],
                "p",
                lazy.spawn(
                    "qtile cmd-obj -o widget pomodoro -f eval -a 'self.update(self.toggle_break())'"
                ),
            ),
        ],
    ),
]

groups = []
group_names = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
]

group_labels = [
    " 일 ",
    " 이 ",
    " 삼 ",
    " 사 ",
    " 오 ",
    " 육 ",
    " 칠 ",
]

group_layouts = [
    "Tile",
    "Monadtall",
    "Tile",
    "Monadtall",
    "Monadtall",
    "Monadtall",
    "Monadtall",
]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        )
    )

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
            # mod1 + shift + letter of group = move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Move focused window to group {}".format(i.name),
            ),
        ]
    )

# Define scratchpads
groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term",
                "kitty --class=scratch",
                width=0.50,
                height=0.50,
                x=0.26,
                y=0.49,
                opacity=1,
            ),
            DropDown(
                "term2",
                "kitty --class=scratch",
                width=0.40,
                height=0.98,
                x=0.595,
                y=0.01,
                opacity=1,
                on_focus_lost_hide=False,
            ),
            DropDown(
                "term3",
                "kitty --class=scratch",
                width=0.80,
                height=0.80,
                x=0.1,
                y=0.1,
                opacity=1,
            ),
            DropDown(
                "yazi",
                "kitty --class=yazi -e yazi",
                width=0.8,
                height=0.8,
                x=0.1,
                y=0.1,
                opacity=1,
            ),
            DropDown(
                "tmux-script",
                "kitty --class=tmux-script -e 'sh ~/.config/scripts/tmux-switch.sh'",
                width=0.4,
                height=0.4,
                x=0.1,
                y=0.1,
                opacity=1,
            ),
            DropDown(
                "qute",
                "qutebrowser",
                width=0.7,
                height=0.7,
                x=0.16,
                y=0.01,
                opacity=1,
            ),
        ],
    )
)

colors = colors.EverForest

layout_theme = {
    "border_width": 2,
    "margin": 4,
    "border_focus": colors[5],
    "border_normal": colors[0],
}

layouts = [
    layout.MonadTall(**layout_theme),
    # layout.Bsp(**layout_theme),
    layout.Tile(
        shift_windows=True,
        add_on_top=False,
        border_width=2,
        margin=0,
        ratio=0.60,
        border_focus=colors[5],
        border_normal=colors[0],
    ),
    layout.Max(
        border_width=0,
        margin=0,
    ),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Bold", fontsize=20, padding=0, background="#1E1E21"
)


powerline = {
    "decorations": [
        PowerLineDecoration(
            path="arrow_right",
            size=15,
        )
    ]
}

extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.Spacer(
            length=1,
            # background=colors[0],
            decorations=[
                PowerLineDecoration(
                    path="arrow_left",
                    size=15,
                ),
            ],
        ),
        widget.Spacer(
            length=1,
            background=colors[2],
            decorations=[
                PowerLineDecoration(
                    path="arrow_left",
                    size=15,
                ),
            ],
        ),
        widget.CurrentLayoutIcon(
            background=colors[0],
            foreground=colors[2],
            padding=8,
            scale=0.65,
        ),
        widget.GroupBox(
            fontsize=22,
            margin_y=2,
            margin_x=5,
            padding_y=2,
            padding_x=1,
            borderwidth=3,
            rounded=True,
            disable_drag=True,
            hide_unused=True,
            active=colors[5],
            highlight_color=colors[0],
            highlight_method="line",
            this_current_screen_border=colors[5],
            this_screen_border=colors[5],
            other_current_screen_border=colors[0],
            other_screen_border=colors[0],
        ),
        widget.Sep(linewidth=3, padding=12, foreground=colors[2]),
        widget.OpenWeather(
            app_key="60af1d9c45fcee59123d9a7f20675f15",
            cityid="1275665",
            format=" {icon} {main_temp}° ",
            metric=True,
            foreground=colors[1],
            update_interval=1800,
        ),
        widget.Sep(linewidth=3, padding=12, foreground=colors[2]),
        widget.Clock(
            foreground=colors[1],
            format=" %a, %d %b ",
        ),
        widget.Spacer(),
        widget.Systray(padding=2),
        widget.Spacer(length=12),
        widget.Net(
            interface="enp37s0",
            format="{down} ",
            foreground=colors[2],
            background="#1E1E21",
            **powerline,
        ),
        widget.CheckUpdates(
            foreground=colors[0],
            background=colors[5],
            colour_have_updates=colors[0],
            colour_no_updates=colors[0],
            display_format=" {updates} ",
            distro="Arch_paru",
            no_update_string="[0]",
            padding=4,
            update_interval=10800,
            **powerline,
        ),
        widget.CPU(
            format=" {load_percent} ",
            foreground=colors[0],
            background=colors[1],
            **powerline,
        ),
        widget.Memory(
            foreground=colors[0],
            background=colors[5],
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(myTerm + " -e btop")},
            format=" {MemUsed:.0f}{mm} ",
            measure_mem="G",
            **powerline,
        ),
        widget.Volume(
            foreground=colors[0],
            background=colors[1],
            fmt=" {} ",
            **powerline,
        ),
        widget.Clock(
            foreground=colors[0],
            background=colors[5],
            format=" %I:%M ",
            **powerline,
        ),
        # widget.Spacer(length=12),
        widget.Pomodoro(
            color_active=colors[0],
            background=colors[1],
            color_break=colors[0],
            color_inactive=colors[0],
            fmt=" <b>{}</b> ",
            **powerline,
        ),
        widget.Spacer(
            length=1,
            background=colors[2],
            **powerline,
        ),
    ]
    return widgets_list


def init_widgets_screen():
    widgets_screen = init_widgets_list()
    return widgets_screen


def init_screens():
    return [
        Screen(bottom=bar.Bar(widgets=init_widgets_screen(), size=36)),
    ]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen = init_widgets_screen()


def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)


mouse = [
    Drag(
        ["mod4"],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        ["mod4"],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click(["mod4"], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_focus=colors[8],
    border_width=4,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="dialog"),  # dialog boxes
        Match(wm_class="download"),  # downloads
        Match(wm_class="error"),  # error msgs
        Match(wm_class="file_progress"),  # file progress boxes
        Match(wm_class="kdenlive"),  # kdenlive
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="notification"),  # notifications
        Match(wm_class="pinentry-gtk-2"),  # GPG key password entry
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="toolbar"),  # toolbars
        Match(wm_class="Yad"),  # yad boxes
        Match(title="branchdialog"),  # gitk
        Match(title="Confirmation"),  # tastyworks exit box
        Match(title="Qalculate!"),  # qalculate-gtk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="tastycharts"),  # tastytrade pop-out charts
        Match(title="tastytrade"),  # tastytrade pop-out side gutter
        Match(title="tastytrade - Portfolio Report"),  # tastytrade pop-out allocation
        Match(wm_class="tasty.javafx.launcher.LauncherFxApp"),  # tastytrade settings
    ],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart.sh"])

wmname = "LG3D"
