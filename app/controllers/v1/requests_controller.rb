class V1::RequestsController < ApplicationController
  def create
    request = Request.new(
      user_id: current_user.id,
      event_id: params[:input_event_id],
      accepted: false,
      message: params[:input_message]
      )
    request.save
    render json: request.as_json
  end

  def index
    requests = Request.all.select {|request| request.event.user_id == current_user.id}
    render json: requests.as_json
  end

  def update
    request_id = params["request_id"]
    request = Request.find_by(id: request_id)
    request.accepted = true
    request.save
  end
end


