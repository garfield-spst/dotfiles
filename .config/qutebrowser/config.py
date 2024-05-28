config.load_autoconfig(True)

c.aliases = {"q": "quit", "w": "session-save", "wq": "quit --save"}

config.set("colors.webpage.darkmode.enabled", False)

config.set("content.cookies.accept", "all", "chrome-devtools://*")

config.set("content.cookies.accept", "all", "devtools://*")

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
    "https://web.whatsapp.com/",
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://accounts.google.com/*",
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36",
    "https://*.slack.com/*",
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://docs.google.com/*",
)

config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0",
    "https://drive.google.com/*",
)

config.set("content.images", True, "chrome-devtools://*")
config.set("content.images", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome-devtools://*")
config.set("content.javascript.enabled", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")

c.downloads.location.directory = "~/Downloads"

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = "multiple"

c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "hoog": "https://hoogle.haskell.org/?hoogle={}",
    "re": "https://www.reddit.com/r/{}",
    "wiki": "https://en.wikipedia.org/wiki/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
}

c.colors.completion.fg = ["#9cc4ff", "white", "white"]

c.colors.completion.odd.bg = "#1c1f24"

c.colors.completion.even.bg = "#232429"

c.colors.completion.category.fg = "#e1acff"

c.colors.completion.category.bg = (
    "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #000000, stop:1 #232429)"
)

c.colors.completion.category.border.top = "#3f4147"

c.colors.completion.category.border.bottom = "#3f4147"

c.colors.completion.item.selected.fg = "#282c34"

c.colors.completion.item.selected.bg = "#ecbe7b"

c.colors.completion.item.selected.match.fg = "#c678dd"

c.colors.completion.match.fg = "#c678dd"

c.colors.completion.scrollbar.fg = "white"

c.colors.downloads.bar.bg = "#282c34"

c.colors.downloads.error.bg = "#ff6c6b"

c.colors.hints.fg = "#282c34"

c.colors.hints.match.fg = "#98be65"

c.colors.messages.info.bg = "#282c34"

c.colors.statusbar.normal.bg = "#282c34"

c.colors.statusbar.insert.fg = "white"

c.colors.statusbar.insert.bg = "#497920"

c.colors.statusbar.passthrough.bg = "#34426f"

c.colors.statusbar.command.bg = "#282c34"

c.colors.statusbar.url.warn.fg = "yellow"

c.colors.tabs.bar.bg = "#1c1f34"

c.colors.tabs.odd.bg = "#282c34"

c.colors.tabs.even.bg = "#282c34"

c.colors.tabs.selected.odd.bg = "#282c34"

c.colors.tabs.selected.even.bg = "#282c34"

c.colors.tabs.pinned.odd.bg = "seagreen"

c.colors.tabs.pinned.even.bg = "darkseagreen"

c.colors.tabs.pinned.selected.odd.bg = "#282c34"

c.colors.tabs.pinned.selected.even.bg = "#282c34"

c.fonts.default_family = '"JetBrainsMono"'

c.fonts.default_size = "15pt"

c.fonts.completion.entry = '15pt "JetBrainsMono"'

c.fonts.debug_console = '15pt "JetBrainsMono"'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '14pt "JetBrainsMono"'

c.fonts.statusbar = '15pt "JetBrainsMono"'

# Bindings to use dmenu rather than qutebrowser's builtin search.
# config.bind('o', 'spawn --userscript dmenu-open')
# config.bind('O', 'spawn --userscript dmenu-open --tab')

# Bindings for normal mode
config.bind("M", "hint links spawn mpv {hint-url}")
config.bind("Z", "hint links spawn st -e youtube-dl {hint-url}")
config.bind("t", "set-cmd-text -s :open -t")
config.bind("xb", "config-cycle statusbar.show always never")
config.bind("xt", "config-cycle tabs.show always never")
config.bind(
    "xx",
    "config-cycle statusbar.show always never;; config-cycle tabs.show always never",
)

# Bindings for cycling through CSS stylesheets from Solarized Everything CSS:
# https://github.com/alphapapa/solarized-everything-css
config.bind(
    ",ap",
    'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/apprentice/apprentice-all-sites.css ""',
)
config.bind(
    ",dr",
    'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/darculized/darculized-all-sites.css ""',
)
config.bind(
    ",gr",
    'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ""',
)
config.bind(
    ",sd",
    'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css ""',
)
config.bind(
    ",sl",
    'config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-everything-css/css/solarized-light/solarized-light-all-sites.css ""',
)
