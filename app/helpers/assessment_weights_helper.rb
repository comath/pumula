module AssessmentWeightsHelper
	def check_percentage_weights
		1 == AssessmentWeights.all.sum(:weights)
	end
end