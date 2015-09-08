100.times do
zip_and_name = CITIES.to_a.sample(1)[0]
street = "#{(1..9).to_a.sample(1)[0]}#{/\d{1,3}/.gen} #{/\w+ /.gen.capitalize}#{STREET_SUFFIX.sample(1)[0]}"
street2 = ["#{/(PO Box|Apt) \d{1,3}/.gen}", ""].sample(1)[0]
puts "#{zip_and_name[0]},#{zip_and_name[1]},#{street},#{street2}"
end
