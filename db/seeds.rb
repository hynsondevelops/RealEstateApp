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
stateAbbreviationHash = Hash.new
idCounter = 0
csv.each do |row|
	State.create!(name: row[0], abbreviation: row[1])
	idCounter += 1
	stateAbbreviationHash[row[1]] = idCounter
end


csv_file = File.read('us_postal_codes.csv')
csv = CSV.parse(csv_file, :headers => true)
csv.each do |row|
	Zipcode.create!(number: row[0], name: row[1], state_id: stateAbbreviationHash[row[3]])
end

Listing.create!(address: "1600 Pennsylvania Ave NW", bedroom_count: "3", bathroom_count: "2.5", area_square_feet: 2000, description: "This is boiler plate for the description of this listing.", price: 150000, state_id: 1, city_id: 1, zipcode_id: 1)


Listing.create!(address: "2135 Queens Chapel Rd NE", bedroom_count: "3", bathroom_count: "2.5", area_square_feet: 2000, description: "This is boiler plate for the description of this listing.", price: 150000, state_id: 1, city_id: 1, zipcode_id: 2)

Listing.create!(address: "915 E St NW", bedroom_count: "3", bathroom_count: "2.5", area_square_feet: 2000, description: "This is boiler plate for the description of this listing.", price: 150000, state_id: 1, city_id: 1, zipcode_id: 3)