Rails.application.routes.draw do  
  root 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  get "lakers" => "lakers#index"
  get "clippers" => "clippers#index"
  get "dodgers" => "dodgers#index"
  get "angels" => "angels#index"
  get "kings" => "kings#index"
  get "ducks" => "ducks#index"
  get "bruins" => "bruins#index"
  get "trojans" => "trojans#index"
  get "sparks" => "sparks#index"
  get "galaxy" => "galaxies#index"
  get "chivas" => "chivas#index"
  get "preps" => "preps#index"

  resources :bookmarks, only: [:index, :create, :destroy]
end
