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

  match '/contacts', to: 'contacts#new', via: 'get'
  match '/users/:id/favorites', to: 'users#favorites', via: 'get', as: :favorites
  
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  
  match '/updated', to: 'games#newest_updates', via: 'get'
  match '/top-rated', to: 'games#high_ratings', via: 'get', as: :top_rated
  match '/consoles', to: 'games#select_consoles', via: 'get'
  match '/genres', to: 'games#select_genres', via: 'get'

  pages = ["nes", "snes", "n64", "wii", "wii_u", "ps", "ps2", "ps3", "ps4", "vita", "xbox", "xbox360", "xbox_one", "pc", "atari", "dreamcast",
  "ios", "other", "action", "adventure", "fighting", "first_person_shooter", "platform", "racing", "rpg", "sports", "misc"]
  
  pages.each do |page|
    match "/#{page}", to: "games##{page}", via: 'get'
	match "/#{page}/games", to: "games##{page}_games", via: 'get'
  end
  
end