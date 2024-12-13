from django.shortcuts import render, redirect
from django.views import View
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


class TicketDetailView(TemplateView):
    template_name = 'ticket_detail.html'

    def get(self, *args, **kwargs):
        ticket = Ticket.objects.get(pk=self.kwargs['pk'])
        context = {
            'ticket': ticket
        }
        return render(self.request, self.template_name, context)


class TicketDeleteView(View):
    def post(self, request, pk):
        try:
            ticket = Ticket.objects.get(pk=pk)
            ticket.delete()
            return redirect('SecretsTicket:ticket')
        except Ticket.DoesNotExist:
            return redirect('SecretsTicket:ticket')
