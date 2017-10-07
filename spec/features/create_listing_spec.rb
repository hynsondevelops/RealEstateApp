require 'rails_helper'
include Devise::Test

feature 'User creates a listing' do
  scenario 'valid fields in form allows creation' do
    user = FactoryGirl.create(:user)
    
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    visit new_user_session_path
    fill_in 'Email', with: 'email1@factory.com'
    fill_in 'Password', with: 'foobar'

    click_button 'Log in'
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
    choose 'listing_rent_or_sell_true'

    click_button 'Create Listing'

    expect(Listing.find_by(address: '2106 Harmony Woods Rd')).to be_valid  
  end

  scenario 'invalid fields in form prevents creation' do
    user = FactoryGirl.create(:user)
    
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    visit new_user_session_path
    fill_in 'Email', with: 'email1@factory.com'
    fill_in 'Password', with: 'foobar'

    click_button 'Log in'
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
    choose 'listing_rent_or_sell_false'

    click_button 'Create Listing'

    expect(Listing.find_by(address: '2106 Harmony Woods Rd')).to eq(nil)  
  end

  scenario 'give flash warnings of fields missing' do
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
    choose 'listing_rent_or_sell_false'

    click_button 'Create Listing'

    expect(page).to have_text("Zipcode must exist")

  end
end 