class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.text :complaint
      t.string :appliance_kind
      t.timestamps null: false
    end
  end
end
