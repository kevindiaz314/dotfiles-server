#!/bin/bash

# Update package lists
sudo dnf update -y

# Install development tools group
sudo dnf group install -y development-tools

# Install requested packages
sudo dnf install -y \
    git \
    neovim \
    bat \
    btop \
    eza \
    fastfetch \
    fd-find \
    fzf \
    git-filter-repo \
    iperf3 \
    ripgrep \
    zoxide \
    jq

echo "Installation complete!"
