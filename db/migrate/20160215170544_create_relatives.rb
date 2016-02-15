class CreateRelatives < ActiveRecord::Migration
  def change
    create_table :relatives do |t|
      t.integer :child_id
      t.integer :parent_id
      t.timestamps null: false
    end
  end
end
