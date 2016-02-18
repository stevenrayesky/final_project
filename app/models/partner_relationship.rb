class PartnerRelationship < ActiveRecord::Base

  belongs_to :first_partner, class_name: "Familymember"
  belongs_to :second_partner, class_name: "Familymember"
end
