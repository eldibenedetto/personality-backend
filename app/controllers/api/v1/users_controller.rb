# require 'rest-client'

class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    user = User.new(user_params)
    if user.save
      token = encode_token({user_id: user.id})
      render json: {user: user, token: token}
    else
      render json: { message: "Invalid username or password"}
    end
  end

  def me
    if @user
      render json: { user: @user, people: @user.people}
    else
      render json: { message: "No JWT Token"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :gender, :username, :password)
  end


end
