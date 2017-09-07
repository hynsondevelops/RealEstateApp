# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
State.create!(name: "DC")

City.create!(name: "Washington", state_id: 1)

Zipcode.create!(name: 20500, state_id: 1)

Listing.create!(address: "1600 Pennsylvania Ave NW", bedroom_count: "3", bathroom_count: "2.5", area_square_feet: 2000, description: "This is boiler plate for the description of this listing.", price: 150000, state_id: 1, city_id: 1, zipcode_id: 1)

