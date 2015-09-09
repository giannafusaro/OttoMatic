include ActionView::Helpers::NumberHelper
class Customer < ActiveRecord::Base
    has_and_belongs_to_many :addresses
    has_and_belongs_to_many :jobs
    validates :last_name, :primary_phone, :jobs, presence: true
    validates :primary_phone, format: { with: /\A[0-9]{10}+\z/,
      message: "Please enter number like this: 6501234567" }

    def self.seed
      Customer.find_each do |c|
        info = c.hash_for_search
        info.each do |entry|
          key = entry[:search_customer]
          1.upto(key.length - 1) do |n|
            prefix = key[0, n]
            REDIS.set "search-customer:#{prefix.downcase}", entry.except(:search_customer).to_json
          end
        end
      end
    end
    def self.terms_for(prefix)
      return REDIS.scan_each(:match => "search-customer:*#{prefix}*").inject([]) do |memo, key|
        memo << JSON.parse(REDIS.get(key))
      end
      # REDIS.sscan "search-customer:#{prefix.downcase}", 0, 9
      # sscan myset 0 match f*
    end

# return an array containing perhaps multiple hashes for one customer
# (customer has multiple addresses)
    def hash_for_search
      return addresses.each.inject([]) do |memo, a|
        memo.push({
          search_customer: "#{last_name} #{first_name} #{primary_phone} #{a.format_for_search}",
          label: "#{last_name}, #{first_name} #{number_to_phone(primary_phone)} #{a.label}",
          customer_id: id,
          address_id: a.id
          })
      end
    end
end
# html = "<span class='name'>#{last_name}, #{first_name}</span>"
# html += "<span class='phone'>#{number_to_phone(primary_phone)}</span>"
# html += "<span class='address'>#{a.label}</span>"
# res[:search_customer] = "#{last_name} #{first_name} #{primary_phone} #{a.format_for_search}"
# res[:label] = "#{last_name}, #{first_name} #{number_to_phone(primary_phone)} #{a.label}"
# res[:customer_id] = id
# res[:address_id] = a.id
