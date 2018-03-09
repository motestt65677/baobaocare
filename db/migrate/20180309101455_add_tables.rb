class AddTables < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.string :name, null: false
      t.date :birthday, null: false



      t.timestamps null: false      
    end

    add_reference :children, :user, foreign_key: true, index: true

    create_table :milestones do |t|
      t.string :title, null: false
      t.string :description
      t.string :type, null: false
      t.string :document
      t.date :date

      t.timestamps null: false      
    end
    add_reference :milestones, :child, foreign_key: true, index: true

    create_table :chatrooms do |t|     
      t.timestamps null: false      
    end
    add_reference :chatrooms, :user, foreign_key: true, index: true
    add_reference :chatrooms, :child, foreign_key: true, index: true

    create_table :comments do |t|
      t.string :text
      t.timestamps null: false      
    end 

    add_reference :comments, :user, foreign_key: true, index: true
    add_reference :comments, :chatroom, foreign_key: true, index: true




    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :qualifications, :string


  end
end
