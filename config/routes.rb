Rails.application.routes.draw do
  get '/welcome', to: "application#welcome"
  namespace :api do
    namespace :v1 do
      post '/users', to: "users#create"
      post '/login', to: "auth#create"
      get '/me', to: "users#me"
    end
  end
end
