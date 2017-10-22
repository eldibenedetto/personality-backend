# require 'rest-client'

class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.new(user_params)
    if user.save
      encode_token({user_id: user.id})
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

  # def fetchAnalysis
  #   username = '688f9ffc-cbe5-4464-9e72-c2a10c8bddfb'
  #   password = '6qAwkELss7y8'
  #   body =
  #
  #   require 'rest-client'
  #
  #   url = "https://#{username}:#{password}@gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13"
  #
  #   response = RestClient.post url, body, :content_type => 'text/plain'
  #
  #   puts response
  # end

end
