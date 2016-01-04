class AddStoreIdToTicket < ActiveRecord::Migration
  def change
    add_reference :tickets, :store, index: true, foreign_key: true
  end
end
