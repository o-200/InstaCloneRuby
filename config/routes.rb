Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  resources :users do
    resources :followers_relationships, only: [:create]
  end

  resources :followers_relationships, only: [:destroy]

  resources :posts do
    resources :likes
    resources :comments
  end
end
