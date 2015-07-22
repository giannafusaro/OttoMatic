class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :number, null: false
      t.integer :apt_number
      t.string :street, null: false
      t.string :city, null: false
      t.integer :zipcode, null: false
      t.timestamps null: false
    end
  end
end
