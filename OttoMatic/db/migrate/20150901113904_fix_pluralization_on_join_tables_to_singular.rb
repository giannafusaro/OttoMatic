class FixPluralizationOnJoinTablesToSingular < ActiveRecord::Migration
  def change
    remove_column :complaints_trips, :complaints_id, :integer
    remove_column :complaints_trips, :trips_id, :integer
    add_column :complaints_trips, :complaint_id, :integer
    add_column :complaints_trips, :trip_id, :integer

    remove_column :appliances_jobs, :appliances_id, :integer
    remove_column :appliances_jobs, :jobs_id, :integer
    add_column :appliances_jobs, :appliance_id, :integer
    add_column :appliances_jobs, :job_id, :integer

    remove_column :appliances_parts, :appliances_id, :integer
    remove_column :appliances_parts, :parts_id, :integer
    add_column :appliances_parts, :appliance_id, :integer
    add_column :appliances_parts, :part_id, :integer
  end
end
