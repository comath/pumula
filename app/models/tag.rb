class Tag < ActiveRecord::Base
	has_and_belongs_to_many :problems
	has_and_belongs_to_many :courses
end
