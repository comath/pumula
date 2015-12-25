class FixScoreProblemAttempt < ActiveRecord::Migration
  def change
  	remove_column :problem_attempts, :points, :decimal, precision: 8, scale: 2
  	add_column :problem_attempts, :score, :decimal, precision: 8, scale: 2
  end
end
