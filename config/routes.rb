Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end

  get "get_meals", to: "application#get_meals"

  root to: "admin#home"

  resources :meals


  devise_for :admins
  namespace :admin do
    resources :meals
  end

end
