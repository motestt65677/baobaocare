class AddChatroomIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :chatroom_id, :integer, index:true, foreign_key: true
  end
end
