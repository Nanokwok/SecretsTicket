from django.db import models


class Ticket(models.Model):
    """Model for a ticket."""
    ticket_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255, default='No title')
    description = models.TextField(default='No description')
