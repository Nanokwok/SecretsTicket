#!/bin/bash

set -e

PYTHON_CMD=$(command -v python3.9 || command -v python3.10 || command -v python3)

# Upgrade pip and core tools
echo "Upgrading pip and core tools"
$PYTHON_CMD -m pip install --upgrade pip setuptools wheel

# Install requirements
echo "Installing requirements"
$PYTHON_CMD -m pip install -r requirements.txt

# Run Django management commands
echo "Running Django management commands"
$PYTHON_CMD manage.py makemigrations SecretsTicket
$PYTHON_CMD manage.py migrate

# Collect static files
echo "Collecting static files"
$PYTHON_CMD manage.py collectstatic --noinput

# Create build directories
echo "Creating build directories"
mkdir -p staticfiles_build/static
cp -r staticfiles/* staticfiles_build/static/ || echo "No static files to copy"

echo "Build complete"