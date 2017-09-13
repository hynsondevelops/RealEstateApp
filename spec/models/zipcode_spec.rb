require 'rails_helper'
RSpec.describe Zipcode, :type => :model do
	subject {build(:zipcode_with_associations)}

	describe "Validations" do
		it "is valid with valid attributes" do
			expect(subject).to be_valid
		end

		it "is not valid without a name" do
			subject.name = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a number" do
			subject.number = nil
			expect(subject).to_not be_valid
		end
	end

	describe "Associations" do
		it "has many listings" do
			expect(subject.listings.size).to eq(3)
		end

		it "belongs to a state" do 
			expect(subject.state).to be_valid
		end
	end

end	