class CreateSiblingRelationships < ActiveRecord::Migration
  def change
    create_table :sibling_relationships do |t|
	  t.integer :first_sibling_id
      t.integer :second_sibling_id
      t.string :kind
      t.timestamps null: false
    end
  end
end
