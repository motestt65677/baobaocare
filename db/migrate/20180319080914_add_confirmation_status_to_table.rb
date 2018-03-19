class AddConfirmationStatusToTable < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :status, :string
    remove_column :reservations, :confirmed
  end
end
