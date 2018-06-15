Rails.application.routes.draw do
  #get "/products/mypost", to: "products#mypost",as: "mypost"

  resources :products do
    collection do
      get 'mypost'
    end
  	resources :steps, only: [:show, :update], controller: "product/steps"
  end
  devise_for :users, controllers: {omniauth_callbacks:  'user/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
  	resources :comments
  end

  resources :comments do
  	resources :comments
  end


  root  'products#index'
end
