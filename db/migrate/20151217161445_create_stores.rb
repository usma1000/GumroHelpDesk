class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store

      t.timestamps null: false
    end
  end
end
