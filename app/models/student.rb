class Student < ActiveRecord::Base
  belongs_to :profile
  belongs_to :section
  has_many :student_attempts
end
