class TicketMailer < ApplicationMailer
  default from: "helpdesk@gumroandassociates.com"
  def new_ticket_email(ticket)
    @ticket = ticket
    mail(to: 'info@gumroandassociates.com', subject: "New Ticket: #{@ticket.subject}")
  end
end
