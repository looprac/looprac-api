class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.belongs_to :user 

      t.string :origin_name
      t.string :destin_name
      t.float :origin_lat, limit: 53
      t.float :origin_lng, limit: 53
      t.float :destin_lat, limit: 53
      t.float :destin_lng, limit: 53
      
      t.integer :departure_time
      t.integer :arrival_time

      t.references :driver, index: true
      t.timestamps null: false
    end
  end
end
