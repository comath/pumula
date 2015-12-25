class AssessmentWeight < ActiveRecord::Base
	has_many :assessments
	validates :name, presence: true

	
end
