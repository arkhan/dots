# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()
c = c  # noqa
config = config  # noqa

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ["multiple-tabs", "downloads"]

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "file://*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "chrome://*/*")

# Enable JavaScript.
# Type: Bool
config.set("content.javascript.enabled", True, "qute://*/*")

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = False

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = "bottom"

# When to show the scrollbar.
# Type: String
# Valid values:
#   - always: Always show the scrollbar.
#   - never: Never show the scrollbar.
#   - when-searching: Show the scrollbar when searching for text in the webpage. With the QtWebKit backend, this is equal to `never`.
c.scrolling.bar = "never"

# Languages to use for spell checking. You can check for available
# languages and install dictionaries using scripts/dictcli.py. Run the
# script with -h/--help for instructions.
# Type: List of String
# Valid values:
#   - af-ZA: Afrikaans (South Africa)
#   - bg-BG: Bulgarian (Bulgaria)
#   - ca-ES: Catalan (Spain)
#   - cs-CZ: Czech (Czech Republic)
#   - da-DK: Danish (Denmark)
#   - de-DE: German (Germany)
#   - el-GR: Greek (Greece)
#   - en-AU: English (Australia)
#   - en-CA: English (Canada)
#   - en-GB: English (United Kingdom)
#   - en-US: English (United States)
#   - es-ES: Spanish (Spain)
#   - et-EE: Estonian (Estonia)
#   - fa-IR: Farsi (Iran)
#   - fo-FO: Faroese (Faroe Islands)
#   - fr-FR: French (France)
#   - he-IL: Hebrew (Israel)
#   - hi-IN: Hindi (India)
#   - hr-HR: Croatian (Croatia)
#   - hu-HU: Hungarian (Hungary)
#   - id-ID: Indonesian (Indonesia)
#   - it-IT: Italian (Italy)
#   - ko: Korean
#   - lt-LT: Lithuanian (Lithuania)
#   - lv-LV: Latvian (Latvia)
#   - nb-NO: Norwegian (Norway)
#   - nl-NL: Dutch (Netherlands)
#   - pl-PL: Polish (Poland)
#   - pt-BR: Portuguese (Brazil)
#   - pt-PT: Portuguese (Portugal)
#   - ro-RO: Romanian (Romania)
#   - ru-RU: Russian (Russia)
#   - sh: Serbo-Croatian
#   - sk-SK: Slovak (Slovakia)
#   - sl-SI: Slovenian (Slovenia)
#   - sq: Albanian
#   - sr: Serbian
#   - sv-SE: Swedish (Sweden)
#   - ta-IN: Tamil (India)
#   - tg-TG: Tajik (Tajikistan)
#   - tr-TR: Turkish (Turkey)
#   - uk-UA: Ukrainian (Ukraine)
#   - vi-VN: Vietnamese (Viet Nam)
c.spellcheck.languages = ["es-ES"]

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = "never"

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = "#000000"

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = "#000000"

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = "#000000"

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = "#ffffff"

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = "#191919"

# Top border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.top = "#191919"

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = "#191919"

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = "#ffcc00"

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = "grey"

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = "black"

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = "darkgrey"

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = "black"

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = "black"

# Foreground color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.fg = "gray"

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = "black"

# Foreground color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.fg = "red"

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = "black"

# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = "Cascadia Code"

# Bindings for normal mode
config.unbind("/")
config.unbind(":")
config.bind("<Alt+x>", "set-cmd-text :")
config.bind("<Ctrl+b>", "scroll left")
config.bind("<Ctrl+c><Ctrl+p>", "spawn --userscript password_fill")
config.bind("<Ctrl+f>", "scroll right")
config.bind("<Ctrl+n>", "scroll down")
config.bind("<Ctrl+p>", "scroll up")
config.bind("<Ctrl+s>", "set-cmd-text /")
config.bind("<Ctrl+u>", "undo")
config.unbind("<Ctrl+w>")
config.unbind("<Ctrl+x>")
config.bind("<Ctrl+x><Ctrl+c>", "close")
config.bind("<Ctrl+x><Ctrl+s>", "download")
config.bind("<Ctrl+x>L", "set-cmd-text :open {url:pretty}")
config.bind("<Ctrl+x>T", "set-cmd-text :open -t -r {url:pretty}")
config.bind("<Ctrl+x>b", "set-cmd-text -s :buffer")
config.bind("<Ctrl+x>k", "tab-close")
config.bind("<Ctrl+x>l", "set-cmd-text -s :open")
config.bind("<Ctrl+x>t", "set-cmd-text -s :open -t")
config.bind("B", "back")
config.bind("F", "forward")
config.unbind("H")
config.unbind("L")
config.unbind("O")
config.unbind("gO")
config.unbind("go")
config.unbind("gt")
config.unbind("h")
config.unbind("j")
config.unbind("k")
config.unbind("l")
config.unbind("o")
config.unbind("u")
