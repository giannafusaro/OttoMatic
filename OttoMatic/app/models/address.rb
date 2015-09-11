class Address < ActiveRecord::Base
  has_and_belongs_to_many :customers
  has_many :jobs
  validates :customers, :zipcode, :street_1, :city, presence: true
  validates :zipcode, inclusion: { in: ZIP_CODES,
    message: "This zipcode is not in our list of zip codes." }
  validates :cities, inclusion: { in: CITY_NAMES,
    message: "This zipcode is not in our list of city names." }

  def label
    "#{street_1} #{street_2} #{city}, #{zipcode}".html_safe
  end

  def self.search_for_matches query
    addresses = search "*#{query}*"
    results = []
    addresses.each do |a|
      a.customers.each do |c|
        results.push(
          JSON.parse({
            label: "#{c.label}#{a.label}",
            customer_id: c.id,
            address_id: a.id
          }.to_json)
        )
      end
    end
    results
  end
end
