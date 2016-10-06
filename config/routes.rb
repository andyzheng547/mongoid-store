Rails.application.routes.draw do
  resources :users, except: [:show]
  root 'users#index'
end
