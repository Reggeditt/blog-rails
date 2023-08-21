Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
  end

  resources :posts, only: [:index, :show] do
  end


  root 'users#index'
end
