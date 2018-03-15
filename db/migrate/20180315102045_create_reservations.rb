class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date "start_date", null: false
      t.date "end_date", null: false
      t.time "start_time", null: false
      t.time "end_time", null: false
      t.integer "chatroom_id"
    end
  end
end
