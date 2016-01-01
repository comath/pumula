class AssessmentWeight < ActiveRecord::Base
	has_many :assessments
	belongs_to :course_instance
	validates :course_instance, presence: true
	validates :name, presence: true
	validates :weight, presence: true

	def valid_percent?
		self.sum(weight) == 1
	end
end
