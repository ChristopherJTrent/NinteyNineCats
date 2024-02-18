Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "cats#index"
  resources :cats, except: [:destroy] do 
    resources :cat_rental_requests, only: [:new]
  end
  resources :cat_rental_requests, only: [:new, :create]
  patch 'cat_rental_requests/approve', to: 'cat_rental_requests#approve'
  patch 'cat_rental_requests/deny', to: 'cat_rental_requests#deny'
end
