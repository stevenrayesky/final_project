class CreateFamilymembers < ActiveRecord::Migration
  def change
    create_table :familymembers do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthday
      t.datetime :death
      t.string :birth_loc
      t.string :death_loc
      t.timestamps null: false
    end
  end
end
