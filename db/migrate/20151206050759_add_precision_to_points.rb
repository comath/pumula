class AddPrecisionToPoints < ActiveRecord::Migration
  def change
  	remove_column :problems, :points, :decimal
  	remove_column :problem_attempts, :score, :decimal
  	add_column :problems, :points, :decimal, precision: 8, scale: 2
  	add_column :problem_attempts, :points, :decimal, precision: 8, scale: 2
  end
end
