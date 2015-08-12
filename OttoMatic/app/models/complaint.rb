class Complaint < ActiveRecord::Base
  has_many :trips
end
