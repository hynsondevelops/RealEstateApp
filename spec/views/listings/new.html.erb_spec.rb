require "rails_helper"

describe 'listings/new.html.erb' do
  before(:all) do
    @listing = Listing.new
  end
  it 'has an address field' do
    render

    expect(rendered).to include '<input type="text" name="listing[address]" id="listing_address" />'
  end

  it 'has a bedroom count field' do

    render

    expect(rendered).to include '<input type="text" name="listing[bedroom_count]" id="listing_bedroom_count" />'
  end

  it 'has a bathroom count field' do

    render

    expect(rendered).to include '<input type="text" name="listing[bathroom_count]" id="listing_bathroom_count" />'
  end

   it 'has a area square feet field' do

    render

    expect(rendered).to include '<input type="text" name="listing[area_square_feet]" id="listing_area_square_feet" />'
  end

   it 'has a description field' do

    render

    expect(rendered).to include '<input type="text" name="listing[description]" id="listing_description" />'
  end

   it 'has a price field' do

    render

    expect(rendered).to include '<input type="text" name="listing[price]" id="listing_price" />'
  end

 it 'has a state abbreviation field' do

    render

    expect(rendered).to include '<input type="text" name="listing[state_abbreviation]" id="listing_state_abbreviation" />'
  end

  it 'has a city name field' do

    render

    expect(rendered).to include '<input type="text" name="listing[city_name]" id="listing_city_name" />'
  end

  it 'has a zipcode number field' do

    render

    expect(rendered).to include '<input type="text" name="listing[zipcode_number]" id="listing_zipcode_number" />'
  end

  it 'has a create button' do
    render 

    expect(rendered).to include 'type="submit"'
  end
  
end

