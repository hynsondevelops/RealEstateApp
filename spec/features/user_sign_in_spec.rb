require 'rails_helper'
include Devise::Test

describe "user login" do
  before(:each) do
    @user = FactoryGirl.create(:user) 
  end

  it 'should make a factory without choking' do
    visit new_user_session_path
    fill_in 'Email', with: 'email1@factory.com'
    fill_in 'Password', with: 'foobar'

    click_button 'Log in'

    expect(page).to have_text("Search")
    # prints out the correnct name for the user
  end
end
