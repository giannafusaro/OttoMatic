include ActionView::Helpers::NumberHelper

class Customer < ActiveRecord::Base
  
    has_and_belongs_to_many :addresses
    has_and_belongs_to_many :jobs

    validates :last_name, :primary_phone, :jobs, presence: true
    validates :primary_phone, format: { with: /\A[0-9]{10}+\z/,
      message: "Please enter number like this: 6501234567" }

    def label
      "#{last_name}, #{first_name} #{number_to_phone(primary_phone)}"
    end
end
