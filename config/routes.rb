Rails.application.routes.draw do
  # devise_for :users
  root to: "friends#index"
end
