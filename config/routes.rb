Rails.application.routes.draw do
  resources :courses
  resources :playlists
  resources :photos
  resources :videos
  post 'authenticate', to: 'authentication#authenticate'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
