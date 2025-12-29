#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q kaffeine | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/kaffeine.svg
export DESKTOP=/usr/share/applications/org.kde.kaffeine.desktop
export DEPLOY_PIPEWIRE=1

# Deploy dependencies
quick-sharun /usr/bin/kaffeine /usr/lib/vlc

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
