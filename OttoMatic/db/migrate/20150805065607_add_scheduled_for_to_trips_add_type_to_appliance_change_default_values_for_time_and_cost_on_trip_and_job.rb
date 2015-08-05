class AddScheduledForToTripsAddTypeToApplianceChangeDefaultValuesForTimeAndCostOnTripAndJob < ActiveRecord::Migration
  def change
    add_column :appliances, :type, :string
    add_column :trips, :scheduled_for, :datetime
    change_column :jobs, :total_time, :int, default: 0
    change_column :jobs, :total_parts, :decimal, precision: 5, scale: 2, default: 0.00
    change_column :jobs, :total_labor, :decimal, precision: 5, scale: 2, default: 0.00
    change_column :jobs, :total_cost, :decimal, precision: 5, scale: 2, default: 0.00
    change_column :jobs, :tax, :decimal, precision: 5, scale: 2, default: 0.00
    change_column :parts, :price, :decimal, precision: 5, scale: 2, default: 0.00
    change_column :trips, :time, :int, default: 0

  end
end
