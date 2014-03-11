class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.integer "page_type_id"
      # same as: t.references :page_type
      t.string "name_tag"
      t.string "permalink"
      t.integer "position"
      t.boolean "visible", :default => false
      t.string "project_review_img"
      t.timestamps
    end
    add_index("pages","page_type_id")
    add_index("pages","permalink")
    Page.create_translation_table! :name => :string, :title => :string, :keyword => :string, :description => :text, :project_review_title => :string, :project_review_short_description => :text
  end
  
  def down
    drop_table :pages
    Page.drop_translation_table!
  end
  
end
