class TicketMailer < ApplicationMailer
  default from: "helpdesk"

  def new_ticket_email(ticket)
    @ticket = ticket
    @subject = "New Ticket - " + @ticket.subject

    mail(to: 'rgumro@gumroandassociates.com', subject: @subject)
  end
end
