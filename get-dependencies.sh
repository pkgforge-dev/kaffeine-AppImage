#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
	kaffeine            \
	kvantum-qt5         \
	pipewire-audio      \
	pipewire-jack       \
	qt5ct               \
	qt5-wayland         \
	vlc-plugin-aalib    \
	vlc-plugin-aom      \
	vlc-plugin-ass      \
	vlc-plugin-avahi    \
	vlc-plugin-bluray   \
	vlc-plugin-caca     \
	vlc-plugin-dvd      \
	vlc-plugin-ffmpeg   \
	vlc-plugin-freetype \
	vlc-plugin-srt      \
	vlc-plugin-svg

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
