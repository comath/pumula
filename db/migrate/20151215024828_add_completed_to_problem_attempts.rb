class AddCompletedToProblemAttempts < ActiveRecord::Migration
  def change
    add_column :problem_attempts, :completed, :boolean
  end
end
