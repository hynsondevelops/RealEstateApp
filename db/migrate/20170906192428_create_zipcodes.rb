class CreateZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.string :name
      t.integer :state_id
      t.timestamps
    end
  end
end
