class Job < ActiveRecord::Base
  has_many :trips
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :appliances
  has_many :addresses, through: :customers
  validates :state, presence: true
  validates :total_time, :total_cost, :total_labor, :total_parts, :tax, numericality: true

  
  TRIP_CHARGE_PENINSULA = 92.50
  TRIP_CHARGE_EAST_BAY = 105.00
  SERVICE_RATE_PER_HOUR = 80.00

  EAST_BAY_CITIES =
  [ "Kensington", "Berkeley", "Albany", "Emeryville", "Oakland", "Piedmont",
    "Alameda", "San Lorenzo", "San Leandro", "Castro Valley", "Newark",
    "Hayward", "Union City", "Fremont" ]

  def trip_charge
    city_name = self.customers[0].addresses[0].city
    EAST_BAY_CITIES.include?(city_name) ? TRIP_CHARGE_EAST_BAY : TRIP_CHARGE_PENINSULA
  end



  # state_machine :state, :initial => :requested do
  #     event :leave_message do
  #       transition [:parts_pending] => :lmor
  #     end
  #     event :schedule do
  #       transition [:parts_pending, :lmor] => :scheduled
  #     end
  #     event :complete_job do
  #       transition [:scheduled] => :completed
  #     end
  #
  #     # state :requested do
  #     #
  #     # end
  #     # state :parts_pending do
  #     #
  #     # end
  #     # state :lmor do
  #     #
  #     # end
  #     # state :scheduled do
  #     #
  #     # end
  #     # state :completed do
  #     #
  #     # end
  #     state_machine :alarm_state, :initial => :active, :namespace => 'alarm' do
  #       event :enable do
  #         transition all => :active
  #       end
  #
  #       event :disable do
  #         transition all => :off
  #       end
  #
  #       state :active, :value => 1
  #       state :off, :value => 0
  #     end
  #
  #     def initialize
  #       super()
  #     end
  # end
end
