class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :content,             limit: 1073741823
      t.integer  :status,          default: 0,      null: false
      t.integer  :priority,        default: 0,      null: false

      t.timestamps null: false
    end

    add_index :tickets, :status
    add_index :tickets, :priority
  end
end
