Rails.application.routes.draw do
  resources :stocks, only: [:index]
  resources :transactions, only: [:create, :index]
  resources :transactions, only: [:new, :create, :index]
  resources :stock_transactions, only: [:new, :create, :index]
  resources :admin, only: [:index]
  resources :users_view, :controller => 'users', only: [:index]

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
  get 'admin/all', to: 'admin#all'
  get 'admin/transactions', to: 'admin#transactions'
  get 'admin/pending', to: 'admin#pending'
  get 'users/approval', to: 'users#approval'
  
  root "users#index"
end
