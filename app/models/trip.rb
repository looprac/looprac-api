class Trip < ActiveRecord::Base
  def driver_uuid
    User.find(user_id).uuid
  end
end
