class AddCourseInstanceToInstructor < ActiveRecord::Migration
  def change
    add_reference :instructors, :course_instance, index: true, foreign_key: true
  end
end
