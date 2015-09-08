class CreateComplaintsTripsTable < ActiveRecord::Migration
  def change
    create_table :complaints_trips do |t|
      t.integer :complaints_id
      t.integer :trips_id
    end
    remove_column :jobs, :state
    add_column :jobs, :state, :string, default: 'requested'

  end
end
