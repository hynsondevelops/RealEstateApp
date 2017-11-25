require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
	describe 'GET #new' do

		it 'requires sign in to render' do
			get :new
			expect(response).to redirect_to("/users/sign_in") 

		end

   		it "has a 302 status code when not signed in" do
      		get :new
      		expect(response.status).to eq(302)
    	end
	end
end
