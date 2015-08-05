class Customer < ActiveRecord::Base
    has_and_belongs_to_many :addresses
    has_and_belongs_to_many :jobs
    accepts_nested_attributes_for :addresses

end
