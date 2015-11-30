class StudentAttempt < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  has_many :problem_attempts
  validates :assignment, :student, presence: true


  def correct_problem_attempts?
  	sub_problems = []
  	problem_attempts.each{|e| sub_problems << e}
  	ass_problems = self.assignment.problems
  	errors.add(:base, "Incorrect Problem Attempt List") unless ass_problems == sub_problems
  end

  def get_total
  	problems.sum(:score)
  end
end
