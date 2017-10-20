class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(username: params[:username], password: params[:password])
    if user.save

      payload = {user_id: user.id}
      token = JWT.encode(payload, "sqlit")

      render json: {user: user, token: token}
    else
      render json: { message: "Invalid username or password"}
    end
  end

  def me
    byebug
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
