Rails.application.routes.draw do
  devise_for :users

  resources :payment_requests
  resources :payment_request_users, only: [:update]

  root to: 'payment_requests#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
