from django.shortcuts import render
from django.views.generic import TemplateView

from SecretsTicket.models import Ticket


# Create your views here.
class HomeView(TemplateView):
    template_name = 'home.html'


class TicketView(TemplateView):
    template_name = 'ticket.html'

    def get(self, *args, **kwargs):
        tickets = Ticket.objects.all()
        context = {
            'tickets': tickets
        }
        return render(self.request, self.template_name, context)
