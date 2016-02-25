class Tree < ActiveRecord::Base
	belongs_to :user
	has_many :familymembers

	def familymembers?
		if familymembers != []
 			true
 		else
 			false
 		end
	end

	def find_origin
		familymembers.where(origin: true).first
	end

end