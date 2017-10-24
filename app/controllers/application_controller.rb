class ApplicationController < ActionController::API

before_action :authorized, except: [:welcome]

def encode_token(payload)
  JWT.encode(payload, "sqlit")
end

def auth_header
  request.headers['Authorization']
end

def decoded_token
  if auth_header
    token = auth_header.split(" ")[1]
    begin
      JWT.decode(token, "sqlit", true, {algorithm: 'HS256'})
    rescue JWT::DecodeError
      [{}]
    end
  else
  end
end

def current_user
  if decoded_token
    @user = User.find(decoded_token[0]["user_id"])
  else
  end
end

def logged_in?
  !!current_user
end

def authorized
  redirect_to "/welcome" unless logged_in?
end

def welcome
  render json: {message:"Please Log-In"}
end

end
