class Section < ActiveRecord::Base
  belongs_to :course_instance
  has_many :students
  has_one :ta
end
