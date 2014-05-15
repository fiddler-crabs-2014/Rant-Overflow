Rails.application.routes.draw do
  resources :users
  resources :rants do
    resources :responses
  end
end
