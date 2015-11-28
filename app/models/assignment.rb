class Assignment < ActiveRecord::Base
  belongs_to :course_instance
  has_many :problems
  has_many :student_attempts
end
