#!/bin/bash

echo "Starting build process..."

# Install dependencies
pip install -r requirements.txt

echo "Dependencies installed."

# Run migrations
python3.9 manage.py makemigrations
python3.9 manage.py migrate

echo "Migrations completed."

# Collect static files
python3.9 manage.py collectstatic --noinput

echo "Static files collected."

echo "Build process completed successfully."
