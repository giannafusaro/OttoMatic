class AddTechnicianToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :technician_id, :integer
  end
end
