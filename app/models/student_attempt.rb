class StudentAttempt < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  has_many :problem_attempts


end
