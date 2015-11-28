class Problem < ActiveRecord::Base
  belongs_to :assignment
  has_many :problem_attempts
end
