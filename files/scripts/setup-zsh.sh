#!/bin/bash
set -e

# Change the default shell for all users created in the future
if [ -f /etc/default/useradd ]; then
    sed -i 's|^SHELL=.*|SHELL=/usr/bin/zsh|' /etc/default/useradd
else
    echo "GROUP=100" > /etc/default/useradd
    echo "HOME=/var/home" >> /etc/default/useradd
    echo "SHELL=/usr/bin/zsh" >> /etc/default/useradd
fi

# Also set root's shell using sed since chsh is missing
sed -i 's|^root:x:0:0:root:/root:/bin/bash|root:x:0:0:root:/root:/usr/bin/zsh|' /etc/passwd
