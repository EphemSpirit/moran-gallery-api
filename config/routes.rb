Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :products do
        resources :reviews, only: [:create, :destroy]
      end
      resources :cart_items, only: [:create, :destroy]
      resources :carts
      resources :reviews, only: [:index]
      resources :blogs, only: [:index, :create, :update, :destroy]
      devise_for :users, controllers: { sessions: 'users/sessions' }
    end
  end
end
