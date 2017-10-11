class AddCompleteAddressToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :complete_address, :string
  end
end
