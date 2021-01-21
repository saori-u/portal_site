Rails.application.routes.draw do
  devise_for :users

  root to: "portals#index"
  resources :portals do
    resources :comments, only: :create
  end
  get "reports/new"
  get "reports/show"
  get "reports/check"
  resources :users, only: :show
end
