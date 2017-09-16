require "rails_helper"

describe 'listings/edit.html.erb' do
  before(:all) do
    @listing = build(:listing)
  end
  it 'has an address field' do
    render

    expect(rendered).to include @listing.address
  end

  it 'has a bedroom count field' do

    render

    expect(rendered).to include @listing.bedroom_count
  end

  it 'has a bathroom count field' do

    render

    expect(rendered).to include @listing.bathroom_count
  end

   it 'has a area square feet field' do

    render

    expect(rendered).to include @listing.area_square_feet.to_s
  end

   it 'has a description field' do

    render

    expect(rendered).to include @listing.description
  end

   it 'has a price field' do

    render

    expect(rendered).to include @listing.price.to_s
    end

 it 'has a state abbreviation field with the current abbreviation' do

    render

    expect(rendered).to include @listing.state.abbreviation
  end

  it 'has a city name field with the current city name' do

    render

    expect(rendered).to include @listing.city.name
  end

  it 'has a zipcode number field with the current number' do

    render

    expect(rendered).to include @listing.zipcode.number
  end

  it 'has a update button' do
    render 

    expect(rendered).to include 'type="submit"'
  end
  
end

