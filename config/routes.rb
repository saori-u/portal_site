Rails.application.routes.draw do
  devise_for :users

  root to: "portals#index"
  resources :portals do
    resources :comments, only: :create
  end

  resources :users, only: :show
end
