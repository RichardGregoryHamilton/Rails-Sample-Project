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
  match '/consoles', to: 'games#select_consoles', via: 'get'
  match '/genres', to: 'games#select_genres', via: 'get'
  match '/help', to: 'games#help', via: 'get'
  match '/help/consoles', to: 'games#consoles', via: 'get'
  match '/help/genres', to: 'games#genres', via: 'get'
  match '/help/users', to: 'games#users', via: 'get'
  
  # Creating routes for Console Pages
  
  match '/nes', to: 'games#nes', via: 'get'
  match '/snes', to: 'games#snes', via: 'get'
  match '/n64', to: 'games#n64', via: 'get'
  match '/wii', to: 'games#wii', via: 'get'
  match '/wii_u', to: 'games#wii_u', via: 'get'
  
  match '/ps', to: 'games#ps', via: 'get'
  match '/ps2', to: 'games#ps2', via: 'get'
  match '/ps3', to: 'games#ps3', via: 'get'
  match '/ps4', to: 'games#ps4', via: 'get'
  match '/vita', to: 'games#vita', via: 'get'
  
  match '/xbox', to: 'games#xbox', via: 'get'
  match '/xbox360', to: 'games#xbox360', via: 'get'
  match '/xbox_one', to: 'games#xbox_one', via: 'get'
  match '/pc', to: 'games#pc', via: 'get'
  
  match '/atari', to: 'games#atari', via: 'get'
  match '/dreamcast', to: 'games#dreamcast', via: 'get'
  match '/ios', to: 'games#ios', via: 'get'
  match '/other', to: 'games#other', via: 'get'
  
  # Creating routes for Genre Pages
  
  match '/action', to: 'games#action', via: 'get'
  match '/adventure', to: 'games#adventure', via: 'get'
  match '/fighting', to: 'games#fighting', via: 'get'
  match '/first_person_shooter', to: 'games#first_person_shooter', via: 'get'
  
  match '/platform', to: 'games#platform', via: 'get'
  match '/racing', to: 'games#racing', via: 'get'
  match '/rpg', to: 'games#rpg', via: 'get'
  match '/sports', to: 'games#sports', via: 'get'
  match '/misc', to: 'games#misc', via: 'get'
				
end
