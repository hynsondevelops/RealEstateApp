require 'rails_helper'
RSpec.describe Listing, :type => :model do
	subject {Listing.find(1)}

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

	it "is not valid without a latitude" do
		subject.latitude = nil
		expect(subject).to_not be_valid
	end

	it "is not valid without a longitude" do
		subject.longitude = nil
		expect(subject).to_not be_valid
	end

end	