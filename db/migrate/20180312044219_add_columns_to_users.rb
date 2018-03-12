class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :specialty, :string
    add_column :users, :experience_years, :integer
    add_column :users, :location, :string
    add_column :users, :position, :string
    add_column :users, :certified, :string
    add_column :users, :number_of_children, :integer
    add_column :users, :type, :string
  end
end
