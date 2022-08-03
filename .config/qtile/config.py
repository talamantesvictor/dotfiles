# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from utils.colors import colors
import os
import subprocess

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

superkey = "mod4"
altkey   = "mod1"
terminal = guess_terminal()

keys = [
    # Switch between windows
    Key([superkey], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([superkey], "j", lazy.layout.down(), desc="Move focus down"),
    Key([superkey], "k", lazy.layout.up(), desc="Move focus up"),
    Key([superkey], "l", lazy.layout.right(), desc="Move focus to right"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([superkey, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([superkey, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([superkey, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([superkey, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([superkey, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([superkey, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([superkey, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([superkey, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([superkey], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Move focus between left/right monitors
    Key([superkey], "s", lazy.next_screen(), desc="Move window to right screen"),
    # Toggle between different layouts as defined below
    Key([superkey], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    Key([superkey], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([superkey, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([superkey, "control"], "x", lazy.shutdown(), desc="Quit qtile"),

    # Open applications
    Key([superkey], "a", lazy.spawn("rofi -show drun"), desc="Applications launcher"),
    Key([altkey], "Tab", lazy.spawn("rofi -show window"), desc="Applications launcher"),
    Key([superkey], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Audio controls
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),
    Key([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),
    # Brigness controls
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set -10%")),
]

# groups = [Group(i) for i in "123456789"]
groups = []
workspaces = [ 
    {"name": "0", "label": "0", "key": "0", "layout": "columns", "matches": [Match(wm_class=["discord"])]},
    {"name": "1", "label": "", "key": "1", "layout": "matrix", "matches": None},
    {"name": "2", "label": "", "key": "2", "layout": "columns", "matches": None},
    {"name": "3", "label": "", "key": "3", "layout": "columns", "matches": None},
    {"name": "4", "label": "", "key": "4", "layout": "columns", "matches": None},
    {"name": "5", "label": "", "key": "5", "layout": "columns", "matches": None},
]

def go_to_group(name):
    def _inner(qtile):
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen()
            return

        if name in '0':
            qtile.focus_screen(0)
            qtile.groups_map[name].cmd_toscreen()
        else:
            qtile.focus_screen(1)
            qtile.groups_map[name].cmd_toscreen()
    return _inner

for ws in workspaces:
    groups.append(Group(ws["name"], layout=ws["layout"], matches=ws["matches"], label=ws["label"]))
    keys.append(
        Key(
            [superkey],
            ws["key"],
            lazy.function(go_to_group(ws["name"])),
            desc="Move focused window, same group",
        )
    )
    keys.append(
        Key(
            [superkey, "shift"],
            ws["key"],
            lazy.window.togroup(ws["name"]),
            desc="Move focused window, same group"
        )
    )

layout_theme = {
    "border_width": 2,
    "margin": 6,
    "border_focus": colors[8],
    "border_normal": colors[1]
}

layouts = [
    layout.Columns(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.Max(**layout_theme),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Mono",
    fontsize=13,
    padding=3,
    background=colors[0],
)
extension_defaults = widget_defaults.copy()

launcher_button = widget.TextBox(
    background=colors[7],
    foreground=colors[0],
    padding=10,
    text="",
    fontsize=40,
    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("rofi -show drun")},
)

groupbox = widget.GroupBox(
    fontsize = 30,
    margin_y = 3,
    margin_x = 10,
    borderwidth = 2,
    active = colors[2],
    inactive = colors[3],
    rounded = False,
    highlight_color = colors[0],
    highlight_method = "line",
    this_current_screen_border = colors[5],
    # other_screen_border = colors[7],
    foreground = colors[2],
    background = colors[0],
    visible_groups=["1","2","3","4","5"]
)

screens = [
    Screen(),
    # Screen(
    #     top=bar.Bar(
    #         [
    #             widget.Spacer(),
    #             widget.WindowName(
    #                 width = bar.CALCULATED,
    #                 padding = 10,
    #                 foreground = colors[3],
    #             ),
    #             widget.Spacer(),
    #         ],
    #         34,
    #         border_width=[0, 0, 3, 0],  # Draw top and bottom borders
    #     ),
    # ),
    Screen(
        top=bar.Bar(
            [
                launcher_button,
                groupbox,
                widget.CurrentLayout(
                    background = "000000",
                    foreground = colors[3],
                    padding = 10,
                ),
                widget.Spacer(),
                widget.WindowName(
                    width = bar.CALCULATED,
                    padding = 10,
                    foreground = colors[3],
                ),
                widget.Spacer(),
                widget.TextBox(
                    text="墳",
                    foreground=colors[2],
                    fontsize=30,
                    padding=8,
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("pavucontrol")},
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=30,
                    foreground="000000",
                    background=colors[0],
                ),
                widget.Clock(
                    background = "000000",
                    foreground = colors[8],
                    padding = 10,
                    format="%A, %B %d",
                ),
                # widget.TextBox(
                #     text=" ",
                #     padding=0,
                #     fontsize=10,
                #     foreground=colors[2],
                #     background=colors[0],
                # ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=30,
                    foreground=colors[8],
                    background="#000000",
                ),
                widget.Clock(
                    background = colors[8],
                    foreground = "000000",
                    padding = 10,
                    # fontsize = 16,
                    format="%I:%M %p"
                ),
            ],
            34,
            border_width=[0, 0, 5, 0],  # Draw top and bottom borders
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([superkey], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([superkey], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([superkey], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
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
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True
# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None
# For Java developers only
wmname = "LG3D"
