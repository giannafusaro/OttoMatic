class Appliance < ActiveRecord::Base
  has_and_belongs_to_many :parts
  has_and_belongs_to_many :jobs
end
