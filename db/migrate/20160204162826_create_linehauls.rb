class CreateLinehauls < ActiveRecord::Migration
  def change
    create_table :linehauls do |t|
      t.string :route

      t.timestamps null: false
    end
  end
end
