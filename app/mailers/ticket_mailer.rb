class TicketMailer < ApplicationMailer
  default from: "admin@gumroandassociates.com"

  def new_ticket_email(ticket)
    @ticket = ticket
    cc_email = @ticket.user.email
    @subject = "New Ticket - " + @ticket.subject

    mail(to: ENV["EMAIL_ADDRESS"], cc: cc_email, subject: @subject)
  end
end
