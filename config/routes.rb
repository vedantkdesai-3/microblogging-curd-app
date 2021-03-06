Rails.application.routes.draw do
  
  root 'home#index'
  
  resources :users 
  resources :microposts 
  resources :follows
  resources :unfollowed 
  resources :sessions, only: [:new, :create, :destroy]

  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'micropost', to: 'microposts#index', as: 'posts'
  get 'follows', to: 'follows#index', as: 'follers'
  get 'landing', to: 'index#landing', as: 'landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
