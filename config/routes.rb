Rails.application.routes.draw do  
  root 'home#index'

  get 'preps/index'
  get 'chivas/index'
  get 'galaxies/index'
  get 'sparks/index'
  get 'trojans/index'
  get 'bruins/index'
  get 'ducks/index'
  get 'kings/index'
  get 'angels/index'
  get 'dodgers/index'
  get 'clippers/index'
  get 'lakers/index'

end
