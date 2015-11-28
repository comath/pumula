class AddInstructorToCourseInstance < ActiveRecord::Migration
  def change
    add_reference :course_instances, :instructor, index: true, foreign_key: true
  end
end
