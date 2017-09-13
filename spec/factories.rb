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
    factory :state_with_associations, :parent => :state do |state|
      listings {build_list :listing, 3}
      cities {build_list :city, 3}
      zipcodes {build_list :zipcode, 3}
    end
  end

  factory :city do
    name "Washington"
    state
    factory :city_with_associations, :parent => :city do |city|
      listings { build_list :listing, 3 }
    end
  end

  factory :zipcode do
    name "DC"
    number "20006"
    state
    factory :zipcode_with_associations, :parent => :zipcode do |zipcode|
      listings { build_list :listing, 3 }
    end
  end

end
