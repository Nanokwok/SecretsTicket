from django.urls import path
from . import views

app_name = "SecretsTicket"

urlpatterns = [
    path('', views.HomeView.as_view(), name='home'),
    path('ticket/', views.TicketView.as_view(), name='ticket'),
]