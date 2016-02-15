class Familymember < ActiveRecord::Base
	has_many :familymembers
	has_many :relatives
	belongs_to :user
	has_many :parents, through: :relatives, source: :familymember, foreign_key: "child_id"
	has_many :children, through: :relatives, source: :familymember, foreign_key: "parent_id"
	has_many :wives, through: :marriages, source: :familymember, foreign_key: "husband_id"
	has_many :husbands, through: :marriages, source: :familymember, foreign_key: "wife_id"


end
