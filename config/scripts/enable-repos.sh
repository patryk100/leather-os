#!/usr/bin/env bash
set -euo pipefail

# 1. Enable RPM Fusion (Required for akmod-v4l2loopback)
# UBlue images usually have these, but we'll ensure they are active for the build
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-43.noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-43.noarch.rpm

# 2. Enable COPR Repositories (The dnf5 way)
# Note: hyprland and starship are actually in the main repos for F43, 
# but we'll enable these for the absolute latest versions.
dnf5 -y copr enable nett00n/hyprland
dnf5 -y copr enable nickavem/keyd
dnf5 -y copr enable chronoscrat/starship

# 3. Force a metadata refresh
dnf5 makecache
