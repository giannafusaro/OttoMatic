class Appliance < ActiveRecord::Base
  has_and_belongs_to_many :parts
  has_and_belongs_to_many :jobs
  validates :brand, :kind, presence: true
  validates :kind, inclusion: { in: APPLIANCE_KIND,
    message: "We don't service kindly to that kind 'round here." }
  validates :brand, inclusion: { in: APPLIANCE_BRAND,
    message: "We don't service kindly to that brand 'round here." }
end
