Rails.application.routes.draw do

  concern :commentable do
    resources :comments, only: [:create, :new]
  end

  concern :likeable do
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show] do
    resources :posts, concerns: [:commentable, :likeable]
  end

  root 'users#index'
end
