class TicketMailer < ApplicationMailer
  default from: "GumroTicketing"

  def new_ticket_email(ticket)
    @ticket = ticket
    @subject = "New Ticket - " + @ticket.subject

    mail(to: 'info@gumroandassociates.com', subject: @subject)
  end
end
