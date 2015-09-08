# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FastSeeder.seed_csv!(Complaint, "complaints.csv", :complaint, :appliance_kind)
FastSeeder.seed_csv!(Trip, "trips.csv", :technician_id, :job_id, :scheduled_for, :time_taken, :summary)
FastSeeder.seed_csv!(Appliance, "appliances.csv", :brand, :model, :serial, :purchased_at, :kind)
FastSeeder.seed_csv!(Part, "parts.csv", :number, :price)
FastSeeder.seed_csv!(Customer, "customers.csv", :last_name, :first_name, :primary_phone, :secondary_phone, :email)
FastSeeder.seed_csv!(Address, "addresses.csv", :zipcode, :city, :street_1, :street_2)
# FastSeeder.seed_csv!(Job, "jobs.csv", :state, :total_time, :total_labor, :total_parts, :tax, :total_cost)
