require 'rails_helper'
RSpec.describe State, :type => :model do
	subject {build(:state_with_associations)}

	describe "Validations" do
		it "is valid with valid attributes" do
			expect(subject).to be_valid
		end

		it "is not valid without a name" do
			subject.name = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without an abbreviation" do
			subject.abbreviation = nil
			expect(subject).to_not be_valid
		end
	end

	describe "Associations" do
		it "has many listings" do
			expect(subject.listings.size).to eq(1)
		end

		it "has many cities" do
			expect(subject.cities.size).to eq(1)
		end

		it "has many zipcodes" do
			expect(subject.zipcodes.size).to eq(1)
		end
	end
end	