Rails.application.routes.draw do
  resources :carts
  devise_for :users

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end

  get "get_meals", to: "application#get_meals"

  root to: "admin#home"

  resources :meals
  resources :orders
  resources :order_meals


  devise_for :admins

  namespace :admin do
    resources :meals do
      member do
        delete "delete_image"
      end
    end
    resources :orders
  end

end
