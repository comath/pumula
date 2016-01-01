class Course < ActiveRecord::Base
  has_many :course_instances
  has_and_belongs_to_many :tags
  validates :name, presence: true, uniqueness: true

end
