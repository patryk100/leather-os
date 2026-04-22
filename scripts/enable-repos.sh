#!/usr/bin/env bash
set -euo pipefail

# Enable COPR repositories
dnf bin core enable -y nett00n/hyprland
dnf bin core enable -y nickavem/keyd
dnf bin core enable -y chronoscrat/starship

# Ensure RPM Fusion is fully present (required for akmods/v4l2loopback)
dnf install -y "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
               "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
