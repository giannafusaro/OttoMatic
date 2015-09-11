ThinkingSphinx::Index.define :address, :with => :active_record do
  indexes street_1
  indexes street_2
  indexes city
  indexes zipcode

  # has customers.id, as: :customer_ids, facet: true, source: :query, type: :integer
  has customers.id, as: :customer_ids, source: :query, facet: true
  indexes customers.last_name, as: :customer_last_names
  indexes customers.first_name, as: :customer_first_names
  indexes customers.primary_phone, as: :customer_phones
  
  set_property min_infix_len: 3
end
