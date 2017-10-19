class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = JWT.encode({user_id:user.id}, "sqlit")
      render json: {user: user, token: token}
    else
      render json: { message: "Invalid username/password" }
    end
  end

end
