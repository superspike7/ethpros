Rails.application.routes.draw do
  resources :stocks, only: [:index]
  resources :transactions, only: [:create, :index]
  resources :transactions, only: [:new, :create, :index]
  resources :stock_transactions, only: [:new, :create, :index]
  resources :admin

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  
  namespace :market do
    resources :stocks, only: [:index, :show]
  end

  get 'home', to: 'static_pages#home'
  get 'transactions/new/:transaction_type(/:symbol)', to: 'transactions#new', as: 'new_transaction'
  
  root "stocks#index"
end
