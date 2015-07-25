class CreateAppliancesPartsJoinTable < ActiveRecord::Migration
  def change
    create_table :appliances_parts do |t|
      t.integer :appliances_id
      t.integer :parts_id
    end
  end
end
