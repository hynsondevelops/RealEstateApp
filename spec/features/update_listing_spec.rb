require 'rails_helper'

feature 'User creates a listing' do
  scenario 'valid fields in form allows updates' do
    visit 'listings/2/edit'
   
    fill_in 'State abbreviation', with: 'VA'

    choose 'listing_rent_or_sell_true'


    click_button 'Update Listing'

    expect(page.html).to have_text("VA")  
  end

  scenario 'give flash warnings of fields missing' do
    visit 'listings/2/edit'

    fill_in 'Zipcode number', with: "0"

    click_button 'Update Listing'

    expect(page).to have_text("Zipcode must exist")
  end
end 