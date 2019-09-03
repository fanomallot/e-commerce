Rails.application.routes.draw do
  devise_for :users
  root to: "item#index"
<<<<<<< HEAD
  resources :item do
  	resources :avatars, only: [:create]
  end
=======
  resources :item
  resources :cart
  resources :user
>>>>>>> development
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
