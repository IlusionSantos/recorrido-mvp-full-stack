Rails.application.routes.draw do
  resources :monitoring_schedules
  resources :availability_schedules
  resources :users
  resources :contrats
  resources :monitoring_services
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
