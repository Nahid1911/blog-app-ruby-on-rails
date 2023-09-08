Rails.application.routes.draw do
  devise_for :users
  get 'comments/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]do
    resources :comments ,only:[:index,:new,:create, :destroy]
    resources :likes ,only:[:create]
    end
  end


  root 'users#index'

  
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, only: [:index]
      end
    end
  end
end
