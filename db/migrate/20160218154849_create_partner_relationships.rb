class CreatePartnerRelationships < ActiveRecord::Migration
  def change
    create_table :partner_relationships do |t|
      t.string :kind
      t.integer :first_partner_id
      t.integer :second_partner_id
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end
  end
end
