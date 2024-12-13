from django.urls import path

from . import views

app_name = "SecretsTicket"

urlpatterns = [
    path('', views.HomeView.as_view(), name='home'),
    path('ticket/', views.TicketView.as_view(), name='ticket'),
    path('ticket/<int:pk>/', views.TicketDetailView.as_view(), name='ticket_detail'),
    path('ticket/<int:pk>/delete/', views.TicketDeleteView.as_view(), name='ticket_delete'),
]
