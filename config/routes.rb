Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :fundraise_offers
      resources :users
      post '/login', to: 'auth#signin'
      post '/logout', to: 'auth#logout'
    end
  end
end
