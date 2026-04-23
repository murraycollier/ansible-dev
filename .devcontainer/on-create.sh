#!/bin/bash
set -e

echo ">>> Updating apt and installing system dependencies..."
sudo apt-get update
sudo apt-get install -y \
  libonig-dev \
  gcc \
  python3-dev

echo ">>> Cloning LazyVim..."
if [ ! -d ~/.config/nvim ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
else
  echo ">>> LazyVim already cloned, skipping..."
fi

echo ">>> Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sudo sh -s -- --yes

echo ">>> Sourcing config file..."
echo "source /workspaces/ansible-env/config" >>/home/mcollier/.bashrc
