class Student < ActiveRecord::Base
  belongs_to :section
  has_many :student_attempts
  validates :name, presence: true
  default_scope {order name: :asc}

  def get_latest_attempt(assessment)
  	student_attempts.where(assessment: assessment).order(created_at: :desc).first
  end
end
