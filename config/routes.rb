Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :payments
      resources :notifications
      resources :movies
    end
  end
end
