class RemoveStartEndFromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :start_end
    add_column :reservations, :end_time, :time
  end
end
