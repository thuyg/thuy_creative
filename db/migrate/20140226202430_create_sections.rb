class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.integer "section_type_id"
      # same as: t.references :section_type
      t.string "name_tag"
      t.integer "position"
      t.boolean "visible", :default => false
      t.timestamps
    end
    add_index("sections", "section_type_id")
    Section.create_translation_table! :content => :text
  end
  
  def down
    drop_table :sections
    Section.drop_translation_table!
  end
  
end
