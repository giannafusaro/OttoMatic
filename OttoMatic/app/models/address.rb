class Address < ActiveRecord::Base
  has_and_belongs_to_many :customers
  validates :customers, :zipcode, :street_1, :city, presence: true
  validates :zipcode, inclusion: { in: ZIP_CODES,
    message: "This zipcode is not in our list of zip codes." }
  validates :cities, inclusion: { in: CITY_NAMES,
    message: "This zipcode is not in our list of city names." }
end
