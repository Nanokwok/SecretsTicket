#!/bin/bash

pip install -r requirements.txt

python3.9 manage.py makemigrations
python3.9 manage.py migrate

#creat superuser from environment variables
echo "from django.contrib.auth.models import User; User.objects.create_superuser('$ADMIN_NAME', '$ADMIN_EMAIL', '$ADMIN_PASSWORD')" | python3.9 manage.py shell

python3.9 manage.py collectstatic --noinput