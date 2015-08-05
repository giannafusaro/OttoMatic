class CreateCustomersJobsJoinTable < ActiveRecord::Migration
  def change
    create_table :customers_jobs do |t|
      t.integer :customer_id
      t.integer :job_id
    end
  end
end
