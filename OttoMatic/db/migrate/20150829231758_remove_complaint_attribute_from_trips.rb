class RemoveComplaintAttributeFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :complaint, :blob
    remove_column :trips, :complaint_id, :integer
  end
end
