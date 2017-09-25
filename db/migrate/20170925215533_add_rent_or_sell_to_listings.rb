class AddRentOrSellToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :rent_or_sell, :boolean
  end
end
