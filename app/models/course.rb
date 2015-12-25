class Course < ActiveRecord::Base
  has_many :course_instances
  validates :name, presence: true, uniqueness: true

end
