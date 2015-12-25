class Instructor < ActiveRecord::Base
  	belongs_to :course_instance
  	validates :name, presence: true
end
