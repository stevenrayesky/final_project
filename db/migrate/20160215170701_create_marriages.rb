class CreateMarriages < ActiveRecord::Migration
  def change
    create_table :marriages do |t|
      t.integer :husband_id
      t.integer :wife_id
      t.date :wedding_date
      t.date :divorce_date
      t.timestamps null: false
    end
  end
end
