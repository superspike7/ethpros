Rails.application.routes.draw do
  resources :stocks, only: [:index]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  root "stocks#index"
end
