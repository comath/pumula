class AddCourseInstanceToAssessmentWeights < ActiveRecord::Migration
  def change
    add_reference :assessment_weights, :course_instance, index: true, foreign_key: true
  end
end
