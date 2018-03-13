class AddDoctorIdMotherId < ActiveRecord::Migration[5.1]
  def change
    remove_column :chatrooms, :user_id
    add_column :chatrooms, :doctor_id, :integer, index:true, foreign_key: true
  end
end
