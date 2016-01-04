class AddCarrierIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :carrier, index: true, foreign_key: true
  end
end
