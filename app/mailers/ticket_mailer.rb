class TicketMailer < ApplicationMailer
  def new_ticket_email(ticket)
    @ticket = ticket
    mail(to: 'anandu@gumroandassociates.com', subject: "New Ticket: #{@ticket.subject}")
  end
end
