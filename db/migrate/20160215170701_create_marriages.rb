class CreateMarriages < ActiveRecord::Migration
  def change
    create_table :marriages do |t|
      t.integer :husband_id
      t.integer :wife_id
      t.datetime :wedding_date
      t.datetime :divorce_date
      t.timestamps null: false
    end
  end
end
