class RemoveTableDepartments < ActiveRecord::Migration
  def change
  	drop_table :deparments
  end
end
