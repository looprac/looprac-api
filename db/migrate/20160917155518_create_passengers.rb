class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.belongs_to :user

      t.string :origin_name
      t.string :dest_name
      t.float :origin_latitude, limit: 53
      t.float :origin_longitude, limit: 53
      t.float :dest_latitude, limit: 53
      t.float :dest_longitude, limit: 53
      
      t.integer :departure_time
      t.integer :arrival_time

      t.references :driver, index: true
      t.timestamps null: false
    end
  end
end
