class CreateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
      t.string "name", :default => "", :null => false
      t.string "email", :default => "", :null => false
      t.text "message_body", :null => false
      t.timestamps
    end
  end
  
  def down
    drop_table :contacts
  end
  
end
