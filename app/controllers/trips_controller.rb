require 'net/http'

class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.create(trip_params.merge(user_id: User.find_by_email(params[:email]).id))
    if @trip.save
      Net::HTTP.post_form(URI.parse("http://localhost:3869/trip/create"), 
                          @trip.to_json(except: [:origin_name, :destin_name, :user_id], methods: :driver_uuid))
    else
      render json: { error: "cannot create trip" }
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:origin_name, :destin_name, :origin_lat, :origin_lng,
                                 :destin_lat, :destin_lng, :leave_after, :arrive_by,
                                 :seats)
  end
end
