class AddJobIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :job_id, :integer, :null => false
  end
end
