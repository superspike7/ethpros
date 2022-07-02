Rails.application.routes.draw do
  resources :stocks, only: [:index]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  get 'home', to: 'static_pages#home'
  
  root "stocks#index"
end
