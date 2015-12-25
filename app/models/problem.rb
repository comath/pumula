class Problem < ActiveRecord::Base
  belongs_to :assessment
  has_many :problem_attempts
  validates :points, numericality: { greater_than: 0 }
end
