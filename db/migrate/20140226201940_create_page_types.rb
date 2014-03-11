class CreatePageTypes < ActiveRecord::Migration
  def up
    create_table :page_types do |t|
      t.string "name_tag"
      t.timestamps
    end
  end
  
  def down
    drop_table :page_types
  end
  
end
