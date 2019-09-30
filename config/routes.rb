# frozen_string_literal: true

Rails.application.routes.draw do
  put 'stripe/add_stripe_token', to: 'stripe#add_stripe_token' 
  put 'stripe/pay_for_course/:id', to: 'stripe#pay_for_course' 
  resources :courses
  resources :playlists
  resources :photos
  resources :videos
  post 'authenticate', to: 'authentication#authenticate'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
