class CreateStudentAttempts < ActiveRecord::Migration
  def change
    create_table :student_attempts do |t|
      t.datetime :hand_in
      t.text :comment
      t.belongs_to :student, index: true, foreign_key: true
      t.references :assignment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
