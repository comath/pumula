class AddNameToInstructor < ActiveRecord::Migration
  def change
    add_column :instructors, :name, :string
  end
end
