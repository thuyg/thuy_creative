class PagesSectionsJoin < ActiveRecord::Migration
  def up
    create_table :pages_sections, :id => false do |t|
      t.references :page
      t.references :section
    end
    add_index :pages_sections, ["page_id", "section_id"]
  end
  
  
  def down
     drop_table :pages_sections
  end
end
