class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :last_name, null: false
      t.string :first_name
      t.string :primary_phone, null: false
      t.string :secondary_phone
      t.string :email
      t.timestamps null: false
    end
  end
end
