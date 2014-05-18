Rails.application.routes.draw do
  root :to => 'rants#index'
  resources :users
  resources :rants do
    resources :responses
  end

  #=============================================
  # User Custom Routes
  get 'sign-up', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  get 'profile', to: 'users#profile', as: 'user_profile'
  resources :sessions, only: [:new, :create, :destroy]

  # /User
  #---------------------------------------------

  #=============================================
  # Rant Custom Routes

  post 'rants/up_vote', to: 'rants#up_vote'
  post 'rants/down_vote', to: 'rants#down_vote'

  # /Rant
  #---------------------------------------------

  #=============================================
  # Response Custom Routes

  post 'responses/up_vote', to: 'responses#up_vote'
  post 'responses/down_vote', to: 'responses#down_vote'

  # /Response
  #---------------------------------------------
end
