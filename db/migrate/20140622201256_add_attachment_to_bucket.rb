class AddAttachmentToBucket < ActiveRecord::Migration
  def up
    add_column :buckets, :attachment, :string
  end
  
  def down
    remove_column :buckets, :attachment
  end
end
