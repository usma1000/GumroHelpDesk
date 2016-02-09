class StatisticsController < ApplicationController
  def index
    @tickets = Ticket.all
    @tickets_this_month = Ticket.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month)
    @tickets_this_week = Ticket.where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week)
  end
end
