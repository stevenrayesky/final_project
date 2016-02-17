class Familymember < ActiveRecord::Base
	has_many :familymembers
	belongs_to :user
	has_many :parent_relatives, class_name: "Relative", foreign_key: "child_id"
	has_many :child_relatives, class_name: "Relative", foreign_key: "parent_id"

	has_many :parents, through: :parent_relatives, source: :parent 
	has_many :children, through: :child_relatives, source: :child

	has_many :wife_marriages, class_name: "Marriage", foreign_key: "husband_id"
	has_many :husband_marriages, class_name: "Marriage", foreign_key: "wife_id"

	has_many :wives, through: :wife_marriages, source: :bride
	has_many :husbands, through: :husband_marriages, source: :groom


end
