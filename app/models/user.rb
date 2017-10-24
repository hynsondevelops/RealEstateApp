class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :listed, class_name: "Listing"
  has_many :followings
  has_many :followed_listings, through: :followings, :source => "listing"
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  ratyrate_rateable "user_score"

  ratyrate_rater

  def followed?(listing)
  	print(followed_listings)
  	followed_listings.each do |cur_listing|
  		if (cur_listing.id == listing.id)
  			return true;
  		end
  	end
  	return false;
  end
end
 