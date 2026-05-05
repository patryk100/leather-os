#!/bin/bash
set -e

# Set the default shell for all future users to ZSH
sed -i 's|SHELL=/bin/bash|SHELL=/usr/bin/zsh|' /etc/default/useradd

# Also set it for the root user just in case
chsh -s /usr/bin/zsh root
