class AddUserIdToComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :mother_id
    remove_column :comments, :doctor_id
    add_column :comments, :user_id, :integer
  end
end
