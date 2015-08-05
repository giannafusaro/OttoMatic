class ChangeAddressFieldsToStreet1AndStreet2 < ActiveRecord::Migration
  def change
    remove_column :addresses, :number, :int
    remove_column :addresses, :street, :string
    add_column :addresses, :street_1, :string
    add_column :addresses, :street_2, :string
  end
end
