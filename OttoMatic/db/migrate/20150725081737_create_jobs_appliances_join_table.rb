class CreateJobsAppliancesJoinTable < ActiveRecord::Migration
  def change
    create_table :appliances_jobs do |t|
      t.integer :appliances_id
      t.integer :jobs_id
    end
  end
end
