Rails.application.routes.draw do
  get 'avatars/create'
  devise_for :users
  root to: "item#index"
  resources :item do
  	resources :avatars, only: [:create]
  end
  resources :cart
  resources :user do
    resources :profil, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
end
