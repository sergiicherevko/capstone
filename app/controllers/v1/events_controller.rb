class V1::EventsController < ApplicationController
  def index
    events = Event.all 
    render json: events.as_json
  end

  def create
    event = Event.new(
      # user_id: params[:user_id],
      # image_url: params[:input_image_url],
      user_id: current_user.id,
      sport_id: params[:input_sport_id],
      name: params[:input_event_name],
      address: params[:input_address],
      available_datetime: params[:input_available_datetime],
      description: params[:input_description]
      )
    event.save
    render json: event.as_json
  end
end
