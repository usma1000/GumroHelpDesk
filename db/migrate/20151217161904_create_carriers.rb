class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
