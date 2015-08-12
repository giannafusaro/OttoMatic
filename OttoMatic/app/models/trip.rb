class Trip < ActiveRecord::Base
  belongs_to :job
  belongs_to :technician
  belongs_to :complaint
end
