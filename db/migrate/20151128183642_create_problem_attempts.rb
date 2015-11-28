class CreateProblemAttempts < ActiveRecord::Migration
  def change
    create_table :problem_attempts do |t|
      t.decimal :score
      t.text :comment
      t.belongs_to :student_attempt, index: true, foreign_key: true
      t.references :problem, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
