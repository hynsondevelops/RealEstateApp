 'rails_helper'


RSpec.describe Listing, :type => :model do
	subject {build(:listing)}
	let(:search_params) {{:address => "", :max_price => "", :min_price => "", :min_bedroom_count => "", :min_bathroom_count => "", :max_area_square_feet => "", :min_area_square_feet => ""}}
	describe "Validations" do
		it "is valid with valid attributes" do
			subject.save
			expect(subject).to be_valid
		end

		it "is not valid without a address" do
			subject.address = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a bedroom_count" do
			subject.bedroom_count = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a bathroom_count" do
			subject.bathroom_count = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without an area_square_feet" do
			subject.area_square_feet = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a description" do
			subject.description = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a price" do
			subject.price = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a state_id" do
			subject.state_id = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a city_id" do
			subject.city_id = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a zipcode_id" do
			subject.zipcode_id = nil
			expect(subject).to_not be_valid
		end

		it "is either a rental or for sale" do
			subject.rent_or_sell = nil
			expect(subject).to_not be_valid
		end
	end

	describe "Associations" do  
		it "has one state" do
			expect(subject.state).to be_valid
		end

		it "has one city" do
			expect(subject.city).to be_valid
		end

		it "has one zipcode" do
			expect(subject.zipcode).to be_valid
		end
	end

	describe "#fullAddress" do
		it "creates a an address consisting of street, city, state, and zipcode" do
			expect(subject.fullAddress).to eq "1600 Pennsylvania Ave NW, Washington, DC, #{subject.zipcode.number}"
		end

		it "returns false if missing a part of address" do
			subject.city_id = nil
			expect(subject.fullAddress).to eq(false)
		end
	end

	describe '#textToID' do
		it "returns false if missing a part of address" do
			subject.city_id = nil
			params = {listing: {state_abbreviation: "DC", zipcode_number: "0", city_name: "Washington"}}
			expect(subject.textToID(params, 0)).to eq(false)
		end

		it "it updates city, state, and zipcode ids if valid " do
			params = {listing: {state_abbreviation: "MD"}}
			State.create!(abbreviation: "MD", name: "Maryland")
			subject.textToID(params, 1)
			expect(subject.state.abbreviation).to eq("MD")
		end

		it "if used in an update context with invalid parameters, it makes the id of the invalid parameter nil" do
			params = {listing: {state_abbreviation: nil}}
			subject.textToID(params, 1)
			expect(subject.city_id).to eq(nil)
		end
	end

	describe '#finalSearch' do
		it "allows searching by address" do
			subject.save
			search_params[:address] = "1600"
			expect(Listing.finalSearch(search_params, 1)[0].address).to eq("1600 Pennsylvania Ave NW")
		end 

		it "allows searching by maximum price" do
			subject.save
			search_params[:max_price] = "1000000"
			expect(Listing.finalSearch(search_params, 1)[0].address).to eq("1600 Pennsylvania Ave NW")		
		end 
		
		it "allows searching by minimum price" do
			subject.save
			search_params[:min_price] = "0"
			expect(Listing.finalSearch(search_params, 1)[0].address).to eq("1600 Pennsylvania Ave NW")		
		end 

		it "allows searching by minimum bedroom_count" do
			subject.save
			search_params[:min_bathroom_count] = "1"
			expect(Listing.finalSearch(search_params, 1)[0].address).to eq("1600 Pennsylvania Ave NW")		
		end 

		it "allows searching by minimum bathroom_count" do
			subject.save
			search_params[:min_bathroom_count] = "1"
			expect(Listing.finalSearch(search_params, 1)[0].address).to eq("1600 Pennsylvania Ave NW")		
		end 

		it "allows searching by maximum area_square_feet" do
			subject.save
			search_params[:max_area_square_feet] = "100000"
			expect(Listing.finalSearch(search_params, 1)[0].address).to eq("1600 Pennsylvania Ave NW")		
		end 
		
		it "allows searching by minimum area_square_feet" do
			subject.save
			search_params[:min_area_square_feet] = "0"
			expect(Listing.finalSearch(search_params, 1)[0].address).to eq("1600 Pennsylvania Ave NW")		
		end 

	end




end	