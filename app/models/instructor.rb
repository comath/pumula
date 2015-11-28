class Instructor < ActiveRecord::Base
  	belongs_to :profile
  	belongs_to :course_instance
end
