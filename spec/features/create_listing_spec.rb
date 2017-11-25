require 'rails_helper'
include Devise::Test

feature 'User creates a listing' do
  scenario 'valid fields in form allows creation' do
    user = FactoryGirl.create(:user)
    zip = FactoryGirl.create(:zipcode)
    city = FactoryGirl.create(:city)
    state = FactoryGirl.create(:state)
    
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    visit new_user_session_path
    fill_in 'Email', with: 'email1@factory.com'
    fill_in 'Password', with: 'foobar'

    click_button 'Log in'
    visit new_listing_path
    
    fill_in 'Address', with: '1600 Pennsylvania Ave NW'
    fill_in 'Bedroom count', with: '3'
    fill_in 'Bathroom count', with: '2'
    fill_in 'Area square feet', with: 1000
    fill_in 'Description', with: 'Description text here'
    fill_in 'Price', with: 10000
    fill_in 'State abbreviation', with: 'DC'
    fill_in 'City name', with: 'Washington'
    fill_in 'Zipcode number', with: "#{zip.number}"
    choose 'listing_rent_or_sell_true'

 
    click_button 'Create Listing'


    expect(page).to have_text('1600 Pennsylvania Ave NW')
  end

  scenario 'invalid fields in form prevents creation' do
    user = FactoryGirl.create(:user)
    zip = FactoryGirl.create(:zipcode)
    city = FactoryGirl.create(:city)
    state = FactoryGirl.create(:state)
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    visit new_user_session_path
    fill_in 'Email', with: user.email
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

    expect(page).to have_text("errors")  
  end

  scenario 'requires user to be signed in' do
    visit new_listing_path

    expect(page).to have_text("Log in")  
  end

  scenario 'give flash warnings of fields missing' do

    user = FactoryGirl.create(:user)
    city = FactoryGirl.create(:city)
    state = FactoryGirl.create(:state)
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'foobar'

    click_button 'Log in'
    visit new_listing_path
     fill_in 'Address', with: '1600 Pennsylvania Ave NW'
    fill_in 'Bedroom count', with: '3'
    fill_in 'Bathroom count', with: '2'
    fill_in 'Area square feet', with: 1000
    fill_in 'Description', with: 'Description text here'
    fill_in 'Price', with: 10000
    fill_in 'State abbreviation', with: 'DC'
    fill_in 'City name', with: 'Washington'
    fill_in 'Zipcode number', with: "0"
    choose 'listing_rent_or_sell_true'


    click_button 'Create Listing'

    expect(page).to have_text("Zipcode can't be blank")

  end
end 