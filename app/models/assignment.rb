class Assignment < ActiveRecord::Base
  belongs_to :course_instance
  has_many :problems, dependent: :destroy
  has_many :student_attempts

  validates :name, :nature, presence: true

  def get_total
  	problems.sum(:points)
  end
end
