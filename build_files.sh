#!/bin/bash

echo Starting build process...

pip install -r requirements.txt

python3.9 manage.py makemigrations
python3.9 manage.py migrate

python3.9 manage.py collectstatic --noinput

echo Build process completed successfully.
