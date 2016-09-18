require 'net/http'

class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.create(trip_params.merge(user_id: User.lookup(params))
    if @trip.save
      Net::HTTP.post_form(URI.parse("http://localhost:3869"), @trip.to_json)
    else
      render json: { error: "cannot create trip" }
    end
  end

  def show
     
  end

  private

  def trip_params
    params.require(:trip).permit(:origin_name, :destin_name, :origin_lat, :origin_lng,
                                 :destin_lat, :destin_lng, :leave_after, :arrive_by,
                                 :seats)
  end
end
