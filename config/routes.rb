Rails.application.routes.draw do
  get 'avatars/create'
  get '/accueil', to: "item#accueil"
  devise_for :users
  root to: "admin#index"
  resources :item ,path: '/produit'  do
  	resources :avatars, only: [:create]
    resources :cart, only: [:update] 
  end
  resources :user , path: '/mon_profil' do
    resources :profil, only: [:create]
  end
  resources :cart , path: '/mon_panier'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders , path: '/commande'
  resources :admin
end
