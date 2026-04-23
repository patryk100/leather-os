#!/usr/bin/env bash
set -euo pipefail

# 1. Enable RPM Fusion (Free & Nonfree)
# These are essential for akmod-v4l2loopback and certain drivers
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
               https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# 2. Enable COPR Repositories
# Note: Fedora 43 uses dnf5, so we use the standard dnf command
dnf -y copr enable nett00n/hyprland
dnf -y copr enable nickavem/keyd
dnf -y copr enable chronoscrat/starship

# 3. Refresh metadata to make sure the new repos are indexed
dnf clean all
dnf makecache
