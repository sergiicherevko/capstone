Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  namespace :v1 do 
    #User
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    #sport
    get "/sports" => "sports#index"
    #user_sports
    post "/user_sports" => "user_sports#create"
    #events
    get "/events" => "events#index"
    #requests
    post "/requests" => "requests#create"
    get "/requests" => "requests#index"
    patch "/requests/:id" => "requests#update"
  end
end
