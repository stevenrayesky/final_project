class Marriage < ActiveRecord::Base

	belongs_to :groom, class_name: "Familymember"
	belongs_to :bride, class_name: "Familymember"
	
end
