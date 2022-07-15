Rails.application.routes.draw do
  resources :stocks, only: [:index]
  resources :stock_transactions, only: [:new, :create, :index]
  resources :admin, only: [:index]
  resources :trader, controller: 'users'
  resources :transactions, only: [:create, :index]
  get 'transactions/new/:transaction_type(/:symbol)', to: 'transactions#new', as: 'new_transaction'

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
  get 'admin/all', to: 'admin#all'
  get 'admin/transactions', to: 'admin#transactions'
  get 'admin/pending', to: 'admin#pending'
  get 'users/approval', to: 'users#approval'
  post 'traders', to: 'users#create'
  
  root "users#index"
end
