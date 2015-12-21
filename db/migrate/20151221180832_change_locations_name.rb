class ChangeLocationsName < ActiveRecord::Migration
  def change
    remove_index :stores, :locations_id
    rename_column :locations, :location, :name
    rename_column :stores, :locations_id, :location_id
    add_index :stores, :location_id
  end
end
