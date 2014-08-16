Games::Application.routes.draw do
  
  resources :games do
    put :favorite, on: :member
	resources :reviews
	resources :images
  end
  
  resources :users, except: [:new]
  resources :sessions, only: [:new, :create, :destroy]
  resources :contacts, only: [:new, :create]
  
  root 'static_pages#welcome'
  
  get "users/new" 
    
  match '/help', to: 'static_pages#help', via: 'get'
  match '/help/consoles', to: 'static_pages#consoles', via: 'get'
  match '/help/genres', to: 'static_pages#genres', via: 'get'
  match '/help/users', to: 'static_pages#users', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/404', to: 'errors#not_found', via: 'get'
  
  match '/contacts', to: 'contacts#new', via: 'get'
  match '/users/:id/favorites', to: 'users#favorites', via: 'get', as: :favorites
  
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  
  match '/updated', to: 'games#newest_updates', via: 'get'
  match '/top-rated', to: 'games#high_ratings', via: 'get', as: :top_rated
  match '/consoles', to: 'games#select_consoles', via: 'get'
  match '/genres', to: 'games#select_genres', via: 'get'
  
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
  
  match '*path', to: 'games#not_found', via: 'get'
				
end
