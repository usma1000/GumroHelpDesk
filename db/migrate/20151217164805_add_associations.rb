class AddAssociations < ActiveRecord::Migration
  def change
    add_reference :stores, :locations, index: true, foreign_key: true
    add_reference :locations, :carriers, index: true, foreign_key: true
    add_reference :carriers, :users, index: true, foreign_key: true
  end
end
