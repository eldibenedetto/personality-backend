Rails.application.routes.draw do
  get '/welcome', to: "application#welcome"
  namespace :api do
    namespace :v1 do
      get '/users', to: "users#index"
      post '/users', to: "users#create"
      post '/login', to: "auth#create"
      get '/me', to: "users#me"
      post '/insights', to: "insights#create"
    end
  end
end
