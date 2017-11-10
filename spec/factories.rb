FactoryGirl.define do
  factory :following do
    
  end
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    phone_number "444-443-4444"
    name "John James"
    company_name "JJ Realtors"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :gallery do
    
  end
  factory :picture do
    
  end
  factory :listing do
    address "1600 Pennsylvania Ave NW"
    bedroom_count "3"
    bathroom_count "2.5"
    area_square_feet 2000
    description "This is boiler plate for the description of this listing."
    price 150000
    rent_or_sell true
    state
    city
    zipcode
    complete_address "1600 Pennsylvania Ave NW, DC,"
    association :lister, factory: :user
  end

  factory :state do
    name "District of Columbia"
    abbreviation "DC"
    factory :state_with_associations, :parent => :state do |state|
      listings {build_list :listing, 1}
      cities {build_list :city, 1}
      zipcodes {build_list :zipcode, 1}
    end
  end

  factory :city do
    name "Washington"
    state
    factory :city_with_associations, :parent => :city do |city|
      listings { build_list :listing, 1 }
    end
  end

  factory :zipcode do
    name "DC"
    sequence(:number) { |n| n }
    state
    factory :zipcode_with_associations, :parent => :zipcode do |zipcode|
      listings { build_list :listing, 1 }
    end
  end

end
