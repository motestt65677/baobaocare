class AddDefaultToStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :reservations, :status, :string, :default => "false"
  end
end
