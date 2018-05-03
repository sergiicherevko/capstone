class V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users.as_json
  end

  def show
    user_id = params["id"]
    user = User.find_by(id: user_id)
    render json: user.as_json
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def update
    user_id = params["id"]
    user = User.find_by(id: user_id)
    user.age = params["age"]
    user.height = params["height"]
    user.weight = params["weight"]
    user.picture_url = params["picture_url"]
    if user.save
      render json: user.as_json
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end
end