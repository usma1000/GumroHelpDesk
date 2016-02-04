class AddLinehaulToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :linehaul, index: true, foreign_key: true
  end
end
