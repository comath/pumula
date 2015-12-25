class ProblemAttempt < ActiveRecord::Base
  belongs_to :student_attempt
  belongs_to :problem
  validates :problem, :score, presence: true
end
