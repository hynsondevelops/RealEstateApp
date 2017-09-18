require "rails_helper"

describe 'listings/show.html.erb' do
  before(:all) do
    @listing = create(:listing)
  end

  it 'displays an address ' do
    render

    expect(rendered).to include @listing.address
  end

  it 'displays a bedroom count ' do

    render

    expect(rendered).to include @listing.bedroom_count
  end

  it 'displays a bathroom count ' do

    render

    expect(rendered).to include @listing.bathroom_count
  end

   it 'displays a area square feet ' do

    render

    expect(rendered).to include @listing.area_square_feet.to_s
  end

   it 'displays a description ' do

    render

    expect(rendered).to include @listing.description
  end

   it 'displays a price ' do

    render

    expect(rendered).to include @listing.price.to_s
    end

 it 'displays a state abbreviation with the current abbreviation' do

    render

    expect(rendered).to include @listing.state.abbreviation
  end

  it 'displays a city name with the current city name' do

    render

    expect(rendered).to include @listing.city.name
  end

  it 'displays a zipcode number with the current number' do

    render

    expect(rendered).to include @listing.zipcode.number
  end

  it 'displays google maps at proper latitude' do

    render

    expect(rendered).to include(@listing.latitude.to_s)

  end

  it 'displays google maps at proper longitude' do

    render

    expect(rendered).to include(@listing.longitude.to_s)

  end

end

