class Zipcode < ApplicationRecord
	validates :name, presence: true
	validates :number, presence: true

	belongs_to :state
	has_many :listings
end
