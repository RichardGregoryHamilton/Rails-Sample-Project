Games::Application.routes.draw do
  
  resources :games do
    put :favorite, on: :member
  end
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :contacts, only: [:new, :create]
  
  root 'games#welcome'
  
  get "users/new" 
    
  match '/about', to: 'games#about', via: 'get'
  match '/contacts', to: 'contacts#new', via: 'get'
  match '/users/:id/favorites', to: 'users#favorites', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  
  match '/top-rated', to: 'games#high_ratings', via: 'get'	
  match '/console-select', to: 'games#select_consoles', via: 'get'
  match '/genre-select', to: 'games#select_genres', via: 'get'
  match '/help', to: 'games#help', via: 'get'
  match '/help/consoles', to: 'games#consoles', via: 'get'
  match '/help/genres', to: 'games#genres', via: 'get'
  match '/help/users', to: 'games#users', via: 'get'
  
  match '/console-select/nes', to: 'games#nes', via: 'get'
  match '/console-select/snes', to: 'games#snes', via: 'get'
  match '/console-select/n64', to: 'games#n64', via: 'get'
  match '/console-select/wii', to: 'games#wii', via: 'get'
  match '/console-select/wii_u', to: 'games#wii_u', via: 'get'
  
  match '/console-select/ps', to: 'games#ps', via: 'get'
  match '/console-select/ps2', to: 'games#ps2', via: 'get'
  match '/console-select/ps3', to: 'games#ps3', via: 'get'
  match '/console-select/ps4', to: 'games#ps4', via: 'get'
  match '/console-select/vita', to: 'games#vita', via: 'get'
  
  match '/console-select/xbox', to: 'games#xbox', via: 'get'
  match '/console-select/xbox360', to: 'games#xbox360', via: 'get'
  match '/console-select/xbox_one', to: 'games#xbox_one', via: 'get'
  match '/console-select/pc', to: 'games#pc', via: 'get'
  
  match '/console-select/atari', to: 'games#atari', via: 'get'
  match '/console-select/dreamcast', to: 'games#dreamcast', via: 'get'
  match '/console-select/ios', to: 'games#ios', via: 'get'
  match '/console-select/other', to: 'games#other', via: 'get'
  
  match '/genre-select/action', to: 'games#action', via: 'get'
  match '/genre-select/adventure', to: 'games#adventure', via: 'get'
  match '/genre-select/fighting', to: 'games#fighting', via: 'get'
  match '/genre-select/first_person_shooter', to: 'games#first_person_shooter', via: 'get'
  
  match '/genre-select/platform', to: 'games#platform', via: 'get'
  match '/genre-select/racing', to: 'games#racing', via: 'get'
  match '/genre-select/rpg', to: 'games#rpg', via: 'get'
  match '/genre-select/sports', to: 'games#sports', via: 'get'
  match '/genre-select/misc', to: 'games#misc', via: 'get'
				
end
