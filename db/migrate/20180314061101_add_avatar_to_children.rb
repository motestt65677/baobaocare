class AddAvatarToChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :avatar, :string
  end
end
