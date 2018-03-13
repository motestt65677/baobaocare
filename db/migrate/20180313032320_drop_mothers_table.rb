class DropMothersTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :mothers

  end
end
