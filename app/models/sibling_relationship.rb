class SiblingRelationship < ActiveRecord::Base

  belongs_to :first_sibling, class_name: "Familymember"
  belongs_to :second_sibling, class_name: "Familymember"
end
