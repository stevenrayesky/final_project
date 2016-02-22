class Tree < ActiveRecord::Base
	belongs_to :user
	has_many :familymembers

	def find_origin
		familymembers.where(origin: true)
	end
	
end