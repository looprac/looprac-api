class Trip < ActiveRecord::Base
  def driver_uuid
    User.find(user_id).uuid
  end

  def create_trip_json
    {
      origin_lat: origin_lat,
      origin_lng: origin_lng,
      destin_lat: destin_lat,
      destin_lng: destin_lng,
      leave_after: leave_after,
      arrive_by: arrive_by,
      seats: seats,
      driver_uuid: driver_uuid
    }
  end
end
