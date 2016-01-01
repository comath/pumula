class CourseInstance < ActiveRecord::Base
  belongs_to :course
  has_many :sections
  has_many :students, through: :sections
  has_many :assessment_weights
  has_one :instructor
  has_many :assessments
  validates :course, :semester, presence: true
end
