class TicketMailer < ApplicationMailer
  default from: "GumroTicketing"

  def new_ticket_email(ticket)
    @ticket = ticket
    cc_email = @ticket.user.email
    @subject = "New Ticket - " + @ticket.subject

    mail(to: 'h&m@gumroandassociates.com', cc: cc_email, subject: @subject)
  end
end
