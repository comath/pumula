require 'test_helper'

class ProblemAttemptTest < ActiveSupport::TestCase
	test "Score and Problem must be non-empty" do
		problem_attempt1 = ProblemAttempt.new
		assert_not problem_attempt1.save
		assert_not problem_attempt1.errors[:problem].empty?
		assert_not problem_attempt1.errors[:score].empty?
	end
end
