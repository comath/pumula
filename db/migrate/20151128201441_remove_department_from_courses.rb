class RemoveDepartmentFromCourses < ActiveRecord::Migration
  def change
    remove_reference :courses, :department, index: true, foreign_key: true
  end
end
