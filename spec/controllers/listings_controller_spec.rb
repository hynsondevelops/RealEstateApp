require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
	describe 'GET #new' do
		it 'renders the form' do
			get :new
			expect(response).to render_template(:new)  
		end

   		it "has a 200 status code" do
      		get :new
      		expect(response.status).to eq(200)
    	end
	end
end
