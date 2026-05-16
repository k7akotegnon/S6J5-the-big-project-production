Rails.application.routes.draw do
  get "cities/show"
  root "gossips#index"

  # Génère les 7 routes CRUD pour les potins
  resources :gossips

  # Routes pour les utilisateurs et les villes (uniquement l'affichage pour le moment)
  resources :cities, only: [ :show ]
  resources :users, only: [:show, :new, :create] # Ajout de new et create pour l'inscription
  resources :sessions, only: [:new, :create, :destroy] # Pour le login/logout

  # Tes pages statiques
  get "/team", to: "static_pages#team"
  get "/contact", to: "static_pages#contact"
  get "/welcome/:first_name", to: "static_pages#welcome"
end
