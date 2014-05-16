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

  # /Rant
  #---------------------------------------------

  #=============================================
  # Response Custom Routes


  # /Response
  #---------------------------------------------
end
