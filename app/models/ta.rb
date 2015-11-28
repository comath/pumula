class Ta < ActiveRecord::Base
	self.table_name = "ta"
  	belongs_to :profile
  	belongs_to :section
end
