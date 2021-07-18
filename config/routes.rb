Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  root to: "friends#index"

  resources :users
  resources :friends
  resources :friend_requests
end
