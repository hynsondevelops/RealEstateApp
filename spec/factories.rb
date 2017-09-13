FactoryGirl.define do
  factory :listing do
    address "1600 Pennsylvania Ave NW"
    bedroom_count "3"
    bathroom_count "2.5"
    area_square_feet 2000
    description "This is boiler plate for the description of this listing."
    price 150000
    state_id 1
    city_id 1
    zipcode_id 1
    
  end
end