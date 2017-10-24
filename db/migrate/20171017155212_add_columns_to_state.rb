class AddColumnsToState < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :flag_file_name, :string
    add_column :states, :flag_content_type, :string
    add_column :states, :flag_file_size, :integer
    add_column :states, :flag_updated_at, :datetime
  end
end
