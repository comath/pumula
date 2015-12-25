class RemoveNatureFromAssessments < ActiveRecord::Migration
  def change
  	remove_column :assessments, :nature
  	add_reference :assessments, :assessment_weights, index: true, foreign_key: true
  end
end
