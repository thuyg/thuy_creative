class CreateBuckets < ActiveRecord::Migration
  def up
    create_table :buckets do |t|
      t.string :name

      t.timestamps
    end
  end
  
  def down
    drop_table :buckets
  end
  
end
