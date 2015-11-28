class ProblemAttempt < ActiveRecord::Base
  belongs_to :student_attempt
  belongs_to :problem
end
