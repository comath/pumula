class Problem < ActiveRecord::Base
  belongs_to :assessment
  has_many :problem_attempts
  has_and_belongs_to_many :tags
  validates :points, numericality: { greater_than: 0 }

	def tag_list
  		tags.map(&:name).join(", ")
	end

  def tag_list=(names)
  	self.tags = names.split(",").map do |n|
    	Tag.where(name: n.strip).first_or_create!
	end
  end
end
