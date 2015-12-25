class Assessment < ActiveRecord::Base
  belongs_to :course_instance
  belongs_to :assessment_weight
  has_many :problems, dependent: :destroy
  has_many :student_attempts

  validates :name, :assessment_weight, presence: true
  default_scope {order due_date: :asc}

  def get_total
  	problems.sum(:points)
  end

  def has_problems?
  	problems.all.empty?
  end

  accepts_nested_attributes_for :problems, :allow_destroy => true
end
