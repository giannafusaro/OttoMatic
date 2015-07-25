class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :number
      t.decimal :price, precision: 5, scale: 2
      t.timestamps null: false
    end
  end
end
