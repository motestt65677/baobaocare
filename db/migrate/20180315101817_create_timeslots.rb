class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.date "start_date", null: false
      t.date "end_date", null: false
      t.time "start_time", null: false
      t.time "end_time", null: false
      t.integer "doctor_id"
    end
  end
end
