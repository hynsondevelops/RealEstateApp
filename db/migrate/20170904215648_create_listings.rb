class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :address
      t.string :bedroom_count
      t.string :bathroom_count
      t.integer :area_square_feet
      t.string :description
      t.integer :price
      t.integer :state_id
      t.integer :city_id
      t.integer :zipcode_id
      t.timestamps
    end
  end
end
