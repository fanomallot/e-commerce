Rails.application.routes.draw do
  get 'avatars/create'
  devise_for :users
  root to: "admin#index"
  resources :item do
  	resources :avatars, only: [:create]
    resources :cart, only: [:update]
  end
  resources :user do
    resources :profil, only: [:create]
  end
  resources :cart
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
  resources :admin
end
