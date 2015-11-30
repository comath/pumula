class FixTypeInAssignments < ActiveRecord::Migration
  def change
  	remove_column :assignments, :type, :string
  	add_column :assignments, :nature, :string 
  end
end
