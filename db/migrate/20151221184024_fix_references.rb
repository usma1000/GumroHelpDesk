class FixReferences < ActiveRecord::Migration
  def change
    remove_index :carriers, :users_id
    remove_index :locations, :carriers_id

    rename_column :locations, :carriers_id, :carrier_id
    rename_column :carriers, :users_id, :user_id

    add_index :locations, :carrier_id
    add_index :carriers, :user_id
  end
end
