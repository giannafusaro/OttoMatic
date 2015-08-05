class ChangeAppliancesSerialToBigIntJobsMoneyTotalsToDecimalAndTimeToIntAndNotesToBlobPartsNumberToBigIntTripsNotesToBlob < ActiveRecord::Migration
  def change
    change_column :appliances, :serial, :bigint

    change_column :jobs, :notes, :blob
    change_column :jobs, :total_time, :int
    change_column :jobs, :total_parts, :decimal, precision: 5, scale: 2
    change_column :jobs, :total_labor, :decimal, precision: 5, scale: 2
    change_column :jobs, :total_cost, :decimal, precision: 5, scale: 2
    change_column :jobs, :tax, :decimal, precision: 5, scale: 2

    change_column :parts, :number, :bigint
    change_column :trips, :notes, :blob


  end
end
