Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  root to: "friends#index"

  resources :users
  resources :friend

  post "/friend/:user_id", to: "friends#create"
end
