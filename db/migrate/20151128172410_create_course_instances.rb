class CreateCourseInstances < ActiveRecord::Migration
  def change
    create_table :course_instances do |t|
      t.string :semester
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
