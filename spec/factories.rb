FactoryGirl.define do
  factory :listing do
    address "1600 Pennsylvania Ave NW"
    bedroom_count "3"
    bathroom_count "2.5"
    area_square_feet 2000
    description "This is boiler plate for the description of this listing."
    price 150000
    state
    city
    zipcode
    
  end

  factory :state do
    name "District of Columbia"
    abbreviation "DC"
  end

  factory :city do
    name "Washington"
    state
  end

  factory :zipcode do
    name "DC"
    number "20006"
    state
  end

end

