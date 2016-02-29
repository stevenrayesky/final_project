class CreateChildRelationships < ActiveRecord::Migration
  def change
    create_table :child_relationships do |t|
      t.integer :child_id
      t.integer :parent_id
      t.integer :kind
      t.timestamps null: false
    end
  end
end
