#!/bin/bash

echo "Starting build process..."

# Check if pip is installed, and install it if it's missing
if ! python3.9 -m pip --version &>/dev/null; then
    echo "pip not found for Python 3.9. Installing..."
    python3.9 -m ensurepip --upgrade
    python3.9 -m pip install --upgrade pip
else
    echo "pip is already installed."
fi

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Run migrations
echo "Running migrations..."
python3.9 manage.py makemigrations
python3.9 manage.py migrate

# Collect static files
echo "Collecting static files..."
python3.9 manage.py collectstatic --noinput

echo "Build process completed successfully."
