class CourseInstance < ActiveRecord::Base
  belongs_to :course
  has_many :sections
  has_one :instructor
  has_many :assignments
end
