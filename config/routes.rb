Rails.application.routes.draw do
  resources :wishlists
  resources :products, only: [:index, :show] do
  resources :users   
    collection do
      post "/login", to: "users#login"
      post "/register", to: "users#register"
      get "/products", to: "products#show"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
