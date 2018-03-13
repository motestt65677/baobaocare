class AddDoctorIdMotherId2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :children, :user_id
    add_column :children, :mother_id, :integer, index:true, foreign_key: true
    drop_table :doctors

  end
end
