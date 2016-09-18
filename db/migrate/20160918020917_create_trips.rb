class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :origin_name
      t.string :destin_name
      t.float :origin_lat, limit: 53
      t.float :origin_lng, limit: 53
      t.float :destin_lat, limit: 53
      t.float :destin_lng, limit: 53

      t.integer :leave_after
      t.integer :arrive_by
      t.integer :seats

      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
