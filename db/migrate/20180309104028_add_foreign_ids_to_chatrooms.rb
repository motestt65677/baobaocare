class AddForeignIdsToChatrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :doctor_id, :integer, index: true 
    add_column :comments, :mother_id, :integer, index: true
    remove_column :comments, :user_id
  end
end
