require 'rails_helper'

feature 'User creates a listing' do
  scenario 'valid fields in form allows creation' do
    visit 'listings/2/edit'
   
    fill_in 'State abbreviation', with: 'VA'

    click_button 'Update Listing'

    expect(page).to have_text("Virginia")  
  end

  scenario 'invalid fields in form prevents creation' do
    visit new_listing_path 

    click_button 'Create Listing'

    expect(Listing.find_by(address: '2106 Harmony Woods Rd')).to eq(nil)  
  end

  scenario 'give flash warnings of fields missing' do
    visit edit_listing_path

    click_button 'Create Listing'

    expect(page).to have_text("Zipcode must exist")

  end
end 