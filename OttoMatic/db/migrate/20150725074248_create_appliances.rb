class CreateAppliances < ActiveRecord::Migration
  def change
    create_table :appliances do |t|
      t.string :brand
      t.string :model
      t.integer :serial
      t.datetime :purchased_at
      t.timestamps null: false
    end
  end
end
