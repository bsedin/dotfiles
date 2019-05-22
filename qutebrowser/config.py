# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['never']

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = False

# Automatically start playing `<video>` elements. Note: On Qt < 5.11,
# this option needs a restart and does not support URL patterns.
# Type: Bool
c.content.autoplay = False

# Allow websites to read canvas elements. Note this is needed for some
# websites to work properly.
# Type: Bool
c.content.canvas_reading = True

# Store cookies. Note this option needs a restart with QtWebEngine on Qt
# < 5.9.
# Type: Bool
c.content.cookies.store = True

# Default encoding to use for websites. The encoding must be a string
# describing an encoding such as _utf-8_, _iso-8859-1_, etc.
# Type: String
c.content.default_encoding = 'utf-8'

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Proxy to use. In addition to the listed values, you can use a
# `socks://...` or `http://...` URL.
# Type: Proxy
# Valid values:
#   - system: Use the system wide proxy.
#   - none: Don't use any proxy
c.content.proxy = 'http://localhost:8118'

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'bottom'

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'about:blank'

# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = False

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = '#d5c4a1'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#1d2021'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#1d2021'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#fabd2f'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#1d2021'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#1d2021'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#1d2021'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#3c3836'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#fabd2f'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.item.selected.border.top = '#fabd2f'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#fabd2f'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#b8bb26'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = '#d5c4a1'

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = '#1d2021'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#1d2021'

# Color gradient start for download text.
# Type: QtColor
c.colors.downloads.start.fg = '#1d2021'

# Color gradient start for download backgrounds.
# Type: QtColor
c.colors.downloads.start.bg = '#83a598'

# Color gradient end for download text.
# Type: QtColor
c.colors.downloads.stop.fg = '#1d2021'

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = '#8ec07c'

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = '#fb4934'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#1d2021'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = '#fabd2f'

# Font color for the matched part of hints.
# Type: QssColor
c.colors.hints.match.fg = '#d5c4a1'

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = '#d5c4a1'

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = '#d5c4a1'

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = '#1d2021'

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = '#1d2021'

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = '#fb4934'

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = '#fb4934'

# Foreground color of a warning message.
# Type: QssColor
c.colors.messages.warning.fg = '#1d2021'

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = '#d3869b'

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = '#d3869b'

# Foreground color of an info message.
# Type: QssColor
c.colors.messages.info.fg = '#d5c4a1'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#1d2021'

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = '#1d2021'

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = '#d5c4a1'

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = '#1d2021'

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = '#1d2021'

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = '#fabd2f'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#b8bb26'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#1d2021'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#1d2021'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#83a598'

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = '#1d2021'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#8ec07c'

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = '#1d2021'

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = '#665c54'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#d5c4a1'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#1d2021'

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = '#d5c4a1'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = '#1d2021'

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = '#1d2021'

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = '#d3869b'

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = '#1d2021'

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = '#83a598'

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = '#83a598'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = '#d5c4a1'

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = '#fb4934'

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = '#d5c4a1'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = '#8ec07c'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#b8bb26'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = '#d3869b'

# Background color of the tab bar.
# Type: QtColor
c.colors.tabs.bar.bg = '#1d2021'

# Color gradient start for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.start = '#83a598'

# Color gradient end for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.stop = '#8ec07c'

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = '#fb4934'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#d5c4a1'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#1d2021'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#d5c4a1'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#1d2021'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#1d2021'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#d5c4a1'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#1d2021'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#d5c4a1'

# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = '"Iosevka Term", Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier, "Liberation Mono", monospace, Fixed, Consolas, Terminal'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '12pt bold monospace'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'bold 12pt monospace'

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = '12pt bold monospace'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = '12pt bold monospace'

# Font used for the hints.
# Type: Font
c.fonts.hints = '12pt bold monospace'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '12pt bold monospace'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = '12pt bold monospace'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = '12pt bold monospace'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = '12pt bold monospace'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '16pt sans-serif'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '12pt bold monospace'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '12pt bold monospace'

# Font family for cursive fonts.
# Type: FontFamily
c.fonts.web.family.cursive = None

# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {'<Ctrl+6>': '<Ctrl+^>', '<Ctrl+Enter>': '<Ctrl+Return>', '<Ctrl+j>': '<Return>', '<Ctrl+m>': '<Return>', '<Ctrl+[>': '<Escape>', '<Enter>': '<Return>', '<Shift+Enter>': '<Return>', '<Shift+Return>': '<Return>'}
