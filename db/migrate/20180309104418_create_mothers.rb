class CreateMothers < ActiveRecord::Migration[5.1]
  def change
    create_table :mothers do |t|

      t.timestamps
    end
  end
end
