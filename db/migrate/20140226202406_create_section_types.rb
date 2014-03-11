class CreateSectionTypes < ActiveRecord::Migration
  def up
    create_table :section_types do |t|
      t.string "name_tag"
      t.timestamps
    end
  end
  
  def down
    drop_table :section_types
  end
  
end
