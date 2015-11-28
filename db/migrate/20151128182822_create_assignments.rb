class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :type
      t.string :name
      t.references :course_instance, index: true, foreign_key: true
      t.datetime :due_date
      t.datetime :act_due_date

      t.timestamps null: false
    end
  end
end
