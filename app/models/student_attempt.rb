class StudentAttempt < ActiveRecord::Base
  belongs_to :student
  belongs_to :assessment
  has_many :problem_attempts
  accepts_nested_attributes_for :problem_attempts  
  validates :assessment, :student, presence: true
  default_scope {order created_at: :desc}

  def correct_problem_attempts?
  	sub_problems = []
  	problem_attempts.each{|e| sub_problems << e}
  	ass_problems = self.assessment.problems
  	errors.add(:base, "Incorrect Problem Attempt List") unless ass_problems == sub_problems
  end

  def get_total
  	problem_attempts.sum(:score)
  end


end
