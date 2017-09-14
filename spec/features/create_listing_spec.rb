require 'rails_helper'

feature 'User creates a listing' do
  scenario 'valid fields in form' do
    visit new_listing_path
    
    fill_in 'Address', with: '2106 Harmony Woods Rd'
    fill_in 'Bedroom count', with: '3'
    fill_in 'Bathroom count', with: '2'
    fill_in 'Area square feet', with: 1000
    fill_in 'Description', with: 'Description text here'
    fill_in 'Price', with: 10000
    fill_in 'State abbreviation', with: 'MD'
    fill_in 'City name', with: 'Owings Mills'
    fill_in 'Zipcode number', with: "21117"

    click_button 'Create Listing'

    expect(Listing.find_by(address: '2106 Harmony Woods Rd')).to be_valid  
  end

  scenario 'invalid fields in form' do
    visit new_listing_path

    fill_in 'Address', with: '2106 Harmony Woods Rd'
    fill_in 'Bedroom count', with: '3'
    fill_in 'Bathroom count', with: '2'
    fill_in 'Area square feet', with: 1000
    fill_in 'Description', with: 'Description text here'
    fill_in 'Price', with: 10000
    fill_in 'State abbreviation', with: 'MD'
    fill_in 'City name', with: 'Owings Mills'
    fill_in 'Zipcode number', with: "0"

    click_button 'Create Listing'

    expect(Listing.find_by(address: '2106 Harmony Woods Rd')).to not_valid  
  end
end