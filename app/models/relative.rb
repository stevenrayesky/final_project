class Relative < ActiveRecord::Base

	belongs_to :child, class_name: "Familymember"
	belongs_to :parent, class_name: "Familymember"
	
end
