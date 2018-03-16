class AddColumnsToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :start_date, :date
    add_column :reservations, :end_date, :date
    add_column :reservations, :start_time, :time
    add_column :reservations, :start_end, :time
    add_column :reservations, :confirmed, :boolean
  end
end
