class RemoveActDueDateFromAssignments < ActiveRecord::Migration
  def change
    remove_column :assignments, :act_due_date, :integer
  end
end
