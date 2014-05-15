Rails.application.routes.draw do
  resources :users
  resources :rants do
    resources :responses
  end

  #=============================================
  # User Custom Routes
  get 'sign-up', to: 'users#new'
  get 'login', to: 'users#login'
  get 'logout', to: 'users#logout'
  # get 'profile'

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
