class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.belongs_to :user

      t.string :origin_name
      t.string :dest_name
      t.string :origin_latitude
      t.string :origin_longitude
      t.string :dest_latitude
      t.string :dest_longitude
      
      t.integer :departure_time
      t.integer :arrival_time
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
