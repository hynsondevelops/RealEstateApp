class State < ApplicationRecord
	validates :name, presence: true
	validates :abbreviation, presence: true

	has_many :listings
	has_many :cities
	has_many :zipcodes
	has_attached_file :flag, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :flag, content_type: /\Aimage\/.*\z/
end
