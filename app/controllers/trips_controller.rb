require 'net/http'

class TripsController < ApplicationController

  REQUEST_URL = "http://localhost:3869/trip/create"

  def index
    send_search_request(REQUEST_URL)
  end

  def create
    @trip = Trip.create(trip_params.merge(user_id: User.find_by_email(params[:email]).id))
    if @trip.save
      @trip.send_create_request(REQUEST_URL)
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

  def send_search_request(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
    request.body =  {
      origin_lat: params[:origin_lat],
      origin_lng: params[:origin_lng],
      destin_lat: params[:destin_lat],
      destin_lng: params[:destin_lng],
      leave_after: params[:leave_after],
      arrive_by: params[:arrive_by],
      seats: params[:seats]
    }.to_json
    # request.body = trip_params.to_json
    http.request(request)
  end
end
