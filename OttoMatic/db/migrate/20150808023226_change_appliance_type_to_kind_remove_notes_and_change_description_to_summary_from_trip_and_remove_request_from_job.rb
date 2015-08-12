class ChangeApplianceTypeToKindRemoveNotesAndChangeDescriptionToSummaryFromTripAndRemoveRequestFromJob < ActiveRecord::Migration
  def change
    add_column :appliances, :kind, :string
    add_column :trips, :complaint, :blob
    add_column :trips, :time_taken, :integer
    add_column :trips, :summary, :blob
    remove_column :addresses, :apt_number
    remove_column :appliances, :type
    remove_column :jobs, :request
    remove_column :trips, :notes
    remove_column :trips, :description
    remove_column :trips, :time
  end
end
