#!/bin/bash

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "[INFO] Python3 not found. Installing Python3..."
    sudo apt update
    sudo apt install -y python3 python3-pip
else
    echo "[INFO] Python3 is already installed."
fi

# Ensure pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "[INFO] pip3 not found. Installing pip3..."
    sudo apt install -y python3-pip
else
    echo "[INFO] pip3 is already installed."
fi

# Install required Python dependencies
echo "[INFO] Installing Python dependencies..."
pip3 install flask psutil flask-socketio

# Open port 8080 in the firewall
echo "[INFO] Configuring firewall to allow traffic on port 8080..."
sudo ufw allow 8080/tcp

# Run the Python application
echo "[INFO] Starting the application on port 8080..."
python3 app.py
