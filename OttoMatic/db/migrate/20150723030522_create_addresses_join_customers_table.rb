class CreateAddressesJoinCustomersTable < ActiveRecord::Migration
  def change
    create_table :addresses_customers do |t|
      t.integer :address_id
      t.integer :customer_id
    end
  end
end
