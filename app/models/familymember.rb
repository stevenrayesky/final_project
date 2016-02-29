class Familymember < ActiveRecord::Base

	SIBLING_TYPE = { 'Full' => 1, 'Half' => 2, 'Step' => 3, 'Adoptive' => 4}

	serialize :children,Array

	has_many :familymembers
	belongs_to :tree

	has_many :parent_relationships, class_name: "ChildRelationship", foreign_key: "child_id"
	has_many :child_relationships, class_name: "ChildRelationship", foreign_key: "parent_id"

	has_many :parents, through: :parent_relationships, source: :parent 
	has_many :childs, through: :child_relationships, source: :child

	has_many :first_partners, class_name: "PartnerRelationship", foreign_key: "second_partner_id"
	has_many :second_partners, class_name: "PartnerRelationship", foreign_key: "first_partner_id"

	has_many :to_partners, through: :first_partners, source: :first_partner 
	has_many :have_partners, through: :second_partners, source: :second_partner 

	has_many :first_siblings, class_name: "SiblingRelationship", foreign_key: "second_sibling_id"
	has_many :second_siblings, class_name: "SiblingRelationship", foreign_key: "first_sibling_id"

	has_many :to_siblings, through: :first_siblings, source: :first_sibling
	has_many :have_siblings, through: :second_siblings, source: :second_sibling

	# Select all times where familymember appears in the PartnerRelationship table and show their partners.
	def partners
		to_partners + have_partners
		
	end

	# Select all times where familymember appears in the SiblingRelationship table and show their siblings.
	def siblings
		to_siblings + have_siblings

	end

	def siblings?(familymember)
		siblings.include? familymember
		
	end

	def childs?
 		if childs != []
 			true
 		else
 			false
 		end
	end

	def fill_array
		self.children = []
		if childs?
			childs.each do |f|
				self.children.push(f)
				if f.childs?
					f.fill_array
				end
			end
		end
	end

	def make_siblings(parent)
		parent.childs.each do |s|
			if self == s || self.siblings?(s)
			else
				@siblings = SiblingRelationship.new(first_sibling_id: self.id, second_sibling_id: s.id)
				if @siblings.save!
					puts "#{self.first_name} and #{s.first_name} are now siblings!"
				else
					"Error saving siblings."
				end
			end
		end
	end
end
