#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

echo "Starting build process..."

# Upgrade pip
python3.9 -m pip install --upgrade pip

# Install dependencies
python3.9 -m pip install -r requirements.txt

echo "Dependencies installed."

# Run migrations
python3.9 manage.py makemigrations
python3.9 manage.py migrate

echo "Migrations completed."

# Collect static files
python3.9 manage.py collectstatic --noinput

echo "Static files collected."

echo "Build process completed successfully."