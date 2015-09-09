namespace :search_suggestions do

  desc 'Seed data to redis for customer search suggestions'
  task seed_customer: :environment do
    Customer.seed
  end

end
