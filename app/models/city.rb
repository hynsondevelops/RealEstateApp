class City < ApplicationRecord
	validates :name, presence: true
	validates :name, uniqueness: {scope: :state_id}
	validates :state_id, presence: true

	has_many :listings
	belongs_to :state
end
