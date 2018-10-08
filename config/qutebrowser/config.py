# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

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

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.item.selected.border.top = "#191919"

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = "#191919"

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = "#ffcc00"

# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = "mononoki NF"

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = "bold 9pt monospace"

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = "bold 9pt monospace"

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = "9pt monospace"

# Font used for error messages.
# Type: Font
c.fonts.messages.error = "9pt monospace"

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = "9pt monospace"

# Font used for prompts.
# Type: Font
c.fonts.prompts = "9pt monospace"

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = "9pt monospace"

# Bindings for normal mode
config.bind("/", None)
config.bind(":", None)
config.bind("<Alt+x>", "set-cmd-text :")
config.bind("<Ctrl+b>", "scroll left")
config.bind("<Ctrl+c><Ctrl+p>", "spawn --userscript password_fill")
config.bind("<Ctrl+f>", "scroll right")
config.bind("<Ctrl+n>", "scroll down")
config.bind("<Ctrl+p>", "scroll up")
config.bind("<Ctrl+s>", "set-cmd-text /")
config.bind("<Ctrl+u>", "undo")
config.bind("<Ctrl+w>", None)
config.bind("<Ctrl+x>", None)
config.bind("<Ctrl+x><Ctrl+c>", "quit")
config.bind("<Ctrl+x><Ctrl+s>", "download")
config.bind("<Ctrl+x>L", "set-cmd-text :open {url:pretty}")
config.bind("<Ctrl+x>T", "set-cmd-text :open -t -r {url:pretty}")
config.bind("<Ctrl+x>k", "tab-close")
config.bind("<Ctrl+x>l", "set-cmd-text -s :open")
config.bind("<Ctrl+x>t", "set-cmd-text -s :open -t")
config.bind("O", None)
config.bind("gO", None)
config.bind("go", None)
config.bind("h", None)
config.bind("j", None)
config.bind("k", None)
config.bind("l", None)
config.bind("o", None)
config.bind("u", None)
