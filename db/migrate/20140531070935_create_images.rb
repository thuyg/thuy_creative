class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.string     :alt,  default: ""
      t.string     :hint, default: ""
      t.attachment :file
      t.timestamps
    end
  end
  
  def down
    def down
      drop_table :images
    end
  end
end