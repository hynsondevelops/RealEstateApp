require 'rails_helper'
RSpec.describe City, :type => :model do
	subject {build(:city_with_associations)}

	describe "Validations" do
		it "is valid with valid attributes" do
			expect(subject).to be_valid
		end

		it "is not valid without a name" do
			subject.name = nil
			expect(subject).to_not be_valid
		end

		it "is not valid without a state_id" do
			subject.state_id = nil
			expect(subject).to_not be_valid
		end
	end

	describe "Associations" do
		it "has many listings" do
			expect(subject.listings.size).to eq(3)
		end

		it "belongs_to a state" do 
			expect(subject.state).to be_valid
		end
	end

end	