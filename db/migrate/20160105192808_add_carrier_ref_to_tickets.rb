class AddCarrierRefToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :carrier, index: true, foreign_key: true
  end
end
