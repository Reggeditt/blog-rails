Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create, :destroy]
    end 
  end

  root 'users#index'
end
