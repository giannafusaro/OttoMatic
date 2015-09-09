class Address < ActiveRecord::Base
  has_and_belongs_to_many :customers
  has_many :jobs
  validates :customers, :zipcode, :street_1, :city, presence: true
  validates :zipcode, inclusion: { in: ZIP_CODES,
    message: "This zipcode is not in our list of zip codes." }
  validates :cities, inclusion: { in: CITY_NAMES,
    message: "This zipcode is not in our list of city names." }

  def label
    "#{street_1} #{street_2} #{city}, #{zipcode}"
  end
  def format_for_search
    "#{street_1} #{street_2} #{city} #{zipcode}"
  end
end
# html = "<span class='street'>#{street_1} #{street_2}</span>"
# html += "<span class='city-zip'>#{city}, <strong>#{zipcode}</strong></span>"
