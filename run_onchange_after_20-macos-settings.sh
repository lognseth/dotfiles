#!/bin/bash
set -e

# Dock behaviour
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock size-immutable -bool true

# Bottom-right Hot Corner
defaults write com.apple.dock wvous-br-corner -int 14

# Rebuild Dock
if command -v dockutil >/dev/null 2>&1; then
    dockutil --remove all --no-restart

    dockutil --add "/System/Applications/Apps.app" --no-restart
    dockutil --add "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app" --no-restart
    dockutil --add "/System/Applications/Messages.app" --no-restart
    dockutil --add "/System/Applications/Mail.app" --no-restart
    dockutil --add "/System/Applications/Photos.app" --no-restart
    dockutil --add "/System/Applications/Calendar.app" --no-restart
    dockutil --add "/System/Applications/Reminders.app" --no-restart
    dockutil --add "/System/Applications/Notes.app" --no-restart
    dockutil --add "/System/Applications/Music.app" --no-restart

    dockutil --add "$HOME/Downloads" \
        --section others \
        --display stack \
        --view grid \
        --sort dateadded \
        --no-restart
fi

killall Dock
