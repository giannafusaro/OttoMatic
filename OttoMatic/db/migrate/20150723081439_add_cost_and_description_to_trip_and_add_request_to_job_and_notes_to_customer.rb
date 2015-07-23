class AddCostAndDescriptionToTripAndAddRequestToJobAndNotesToCustomer < ActiveRecord::Migration
  def change
    add_column :jobs, :customer_id, :integer, :null => false
  end
end
