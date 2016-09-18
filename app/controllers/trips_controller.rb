require 'net/http'

class TripsController < ApplicationController

  CREATE_URL = "http://localhost:3869/trip/create"
  SEARCH_URL = "http://localhost:3869/trip/search"

  def create
    @trip = Trip.create(trip_params.merge(user_id: User.find_by_email(params[:email]).id))
    if @trip.save
      @trip.send_create_request(CREATE_URL)
      render plain: "Such API! Much cool! Wow!"
    else
      render json: { error: "cannot create trip" }
    end
  end

  def search
    send_search_request(SEARCH_URL)
    render plain: "Such API! Much cool! Wow!"
  end

  private

  def trip_params
    params.permit(:origin_name, :destin_name, :origin_lat, :origin_lng,
                  :destin_lat, :destin_lng, :leave_after, :arrive_by,
                  :seats)
  end

  def send_search_request(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
    request.body =  {
      origin_lat: params[:origin_lat].to_f,
      origin_lng: params[:origin_lng].to_f,
      destin_lat: params[:destin_lat].to_f,
      destin_lng: params[:destin_lng].to_f,
      leave_after: params[:leave_after].to_f,
      arrive_by: params[:arrive_by].to_f
    }.to_json
    # request.body = trip_params.to_json
    http.request(request)
  end
end
