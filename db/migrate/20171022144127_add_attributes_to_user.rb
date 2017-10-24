class AddAttributesToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :phone_number, :string
  	add_column :users, :name, :string
  	add_column :users, :rating, :integer
  	add_column :users, :company_name, :string
  	add_column :users, :photo_file_name, :string
  	add_column :users, :photo_content_type, :string
  	add_column :users, :photo_file_size, :integer
  	add_column :users, :photo_updated_at, :datetime 
  end
end
