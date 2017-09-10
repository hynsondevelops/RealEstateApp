# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
csv_file = File.read('us_state_abbreviations.csv')
csv = CSV.parse(csv_file, :headers => true)
csv.each do |row|
	State.create!(name: row[0], abbreviation: row[1])
end


csv_file = File.read('us_postal_codes.csv')
csv = CSV.parse(csv_file, :headers => true)
csv.each do |row|
	state_id = nil
	Zipcode.create!(name: row[0])
end
zone0 = ["Connecticut", "Massachusetts", "Maine", "New Hampshire", "New Jersey", "Puerto Rico", "Rhode Island", "Vermont", "Virgin Islands"]
zone1 = ["Delaware", "New York", "Pennsylvania"]
zone2 = ["District of Columbia", "Maryland", "North Carolina", "South Carolina", "Virginia", "West Virginia"]
zone3 = ["Alabama", "Florida", "Georgia", "Mississippi", "Tennessee"]
zone4 = ["Indiana", "Kentucky", "Michigan", "Ohio"]
zone5 = ["Iowa", "Minnesota", "Montana", "North Dakota", "South Dakota", "Wisconsin"]
zone6 = ["Illinois", "Kansas", "Missouri", "Nebraska"]
zone7 = ["Arkansas", "Louisiana", "Oklahoma", "Texas"]
zone8 = ["Arizona", "Colorado", "Idaho", "New Mexico", "Nevada", "Utah", "Wyoming"]
zone9 = ["Alaska", "American Samoa", "California", "Guam", "Hawaii", "Marshall Islands", "Federated States of Micronesia", "Northern Mariana Islands", "Oregon", "Palau", "Washington"]
zoneCategories = [zone0, zone1, zone2, zone3, zone4, zone5, zone6, zone7, zone8, zone9]

zoneCategories.each do |zoneCat|
	zoneCat.each do |zone|
		State.create!(name: zone)
	end
end

Listing.create!(address: "1600 Pennsylvania Ave NW", bedroom_count: "3", bathroom_count: "2.5", area_square_feet: 2000, description: "This is boiler plate for the description of this listing.", price: 150000, state_id: 1, city_id: 1, zipcode_id: 1)


Listing.create!(address: "2135 Queens Chapel Rd NE", bedroom_count: "3", bathroom_count: "2.5", area_square_feet: 2000, description: "This is boiler plate for the description of this listing.", price: 150000, state_id: 1, city_id: 1, zipcode_id: 2)

Listing.create!(address: "915 E St NW", bedroom_count: "3", bathroom_count: "2.5", area_square_feet: 2000, description: "This is boiler plate for the description of this listing.", price: 150000, state_id: 1, city_id: 1, zipcode_id: 3)