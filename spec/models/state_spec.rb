require 'rails_helper'
RSpec.describe State, :type => :model do
	subject {build(:state)}

	describe "Validations" do
		it "is valid with valid attributes" do
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
			expect(subject.fullAddress).to eq "1600 Pennsylvania Ave NW, Washington, DC, 20006"
		end
	end

end	