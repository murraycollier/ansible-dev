#!/bin/bash
set -e

echo ">>> Creating Python virtual environment..."
python3 -m venv ~/.venv

echo ">>> Upgrading pip..."
~/.venv/bin/pip install --upgrade pip

echo ">>> Installing Python requirements..."
~/.venv/bin/pip install -r ./requirements.txt

# Install rust/cargo first if not present
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Then install bob
cargo install bob-nvim

bob use latest

cp ./starship.toml ~/config
echo ">>> Setup complete!"
