class RemoveInstructorToCourseInstance < ActiveRecord::Migration
  def change
    remove_reference :course_instances, :instructor, index: true, foreign_key: true
  end
end
