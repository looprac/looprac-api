class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.belongs_to :user

      t.string :origin_name
      t.string :destin_name
      t.float :origin_lat, limit: 53
      t.float :origin_lng, limit: 53
      t.float :destin_lat, limit: 53
      t.float :destin_lng, limit: 53
      
      t.integer :departure_time
      t.integer :arrival_time
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
