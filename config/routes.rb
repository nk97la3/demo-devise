Rails.application.routes.draw do
  resources :products do
  	resources :steps, only: [:show, :update], controller: "product/steps"
  end
  devise_for :users, controllers: {omniauth_callbacks:  'user/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
  	resources :comments
  end
  resources :comments do
  	resources :comments
  end
  root  'products#index'
end
