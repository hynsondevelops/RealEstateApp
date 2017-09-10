class AddNumberToZipcodes < ActiveRecord::Migration[5.0]
  def change
    add_column :zipcodes, :number, :string
  end
end
