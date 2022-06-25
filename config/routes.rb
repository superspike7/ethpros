Rails.application.routes.draw do
  # get 'static_pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD

  resources :stocks, only: [:index]
=======
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
>>>>>>> setup devise layout, controllers, and views
  # Defines the root path route ("/")
  root "stocks#index"
end
