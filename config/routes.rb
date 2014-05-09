Rails.application.routes.draw do  
  root 'home#index'

  resources :lakers
  resources :clippers
  resources :dodgers
  resources :angels
  resources :kings
  resources :ducks
  resources :bruins
  resources :trojans
  resources :sparks
  resources :galaxies
  resources :chivas
  resources :preps

end
