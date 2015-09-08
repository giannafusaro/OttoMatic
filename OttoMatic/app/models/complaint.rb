class Complaint < ActiveRecord::Base
  has_and_belongs_to_many :trips
  validates :trips, :appliance_kind, presence: true
  validates :appliance_kind, inclusion: { in: APPLIANCE_KIND,
    message: "We don't service that kind 'round here."}
end
