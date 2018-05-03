class V1::UserSportsController < ApplicationController
  def create
    user_sport = UserSport.find_or_create_by(user_id: params[:user_id], sport_id: params[:sport_id])
    # user_sport = UserSport.new(
    #   user_id: params[:user_id],
    #   sport_id: params[:sport_id],
    #   sport_level: params[:sport_level],
    #   summary: params[:summary],
    #   )
    user_sport.sport_level = params[:sport_level]
    user_sport.summary = params[:summary]
    if user_sport.save
      render json: {message: 'User_sport created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
