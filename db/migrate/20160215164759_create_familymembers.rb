class CreateFamilymembers < ActiveRecord::Migration
  def change
    create_table :familymembers do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.date :death
      t.string :birth_loc
      t.string :death_loc
      t.integer :tree_id
      t.timestamps null: false
    end
  end
end
