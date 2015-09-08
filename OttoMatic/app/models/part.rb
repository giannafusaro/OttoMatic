class Part < ActiveRecord::Base
  has_and_belongs_to_many :appliances

  after_save :update_total_parts

end
