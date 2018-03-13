class AddColumnToMilestones < ActiveRecord::Migration[5.1]
  def change
    
    remove_column :milestones, :type, :string
    add_column :milestones, :age_group, :string
  end
end
