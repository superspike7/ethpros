Rails.application.routes.draw do
  devise_for :users
  # get 'static_pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :stocks, only: [:index]
  # Defines the root path route ("/")
  root "stocks#index"
end
