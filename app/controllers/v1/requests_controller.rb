class V1::RequestsController < ApplicationController
  def create
    request = Request.new(
      user_id: params[:user_id],
      event_id: params[:event_id],
      accepted: false,
      message: params[:message]
      )
    request.save
    render json: request.as_json
  end

  def index
    requests = Request.all
    render json: requests.as_json
  end

  def update
    request_id = params["request_id"]
    request = Request.find_by(id: request_id)
    request.accepted = true
    request.save
  end
end


