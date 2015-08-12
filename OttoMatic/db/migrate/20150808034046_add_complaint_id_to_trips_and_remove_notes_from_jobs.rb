class AddComplaintIdToTripsAndRemoveNotesFromJobs < ActiveRecord::Migration
  def change
    add_column :trips, :complaint_id, :integer
    remove_column :jobs, :notes
  end
end
