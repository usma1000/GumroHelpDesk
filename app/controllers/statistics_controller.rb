class StatisticsController < ApplicationController
  def index
    @tickets = Ticket.all
    @tickets_this_month = Ticket.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month)
    @tickets_this_week = Ticket.where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week)
    @tickets_last_month = Ticket.where(:created_at => Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month)
    @tickets_today = Ticket.where(:created_at => Time.now.beginning_of_day..Time.now.end_of_day)
  end
end
