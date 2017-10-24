class Api::V1::AuthController < ApplicationController

 skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(username: params[:username])
    user_insight = user.insight ? user.insight : ""
    if user && user.authenticate(params[:password])
      token = encode_token({user_id: user.id})
      render json: {user: user, insight: user_insight, token: token}
    else
      render json: { message: "Invalid username/password" }
    end
  end

end
