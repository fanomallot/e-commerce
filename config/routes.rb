Rails.application.routes.draw do
  devise_for :users
  root to: "item#index"
  resources :item
  resources :cart
  resources :user do
    resources :profil, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "item#index"
  resources :cart
  resources :item
  resources :user
end
