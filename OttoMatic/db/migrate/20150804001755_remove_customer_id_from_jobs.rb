class RemoveCustomerIdFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :customer_id
  end
end
