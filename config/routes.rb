Rails.application.routes.draw do
  root 'mainpage#index'
  post 'mainpage/create', to: 'mainpage#create', as: 'create'
  get 'mainpage/view', to: 'mainpage#view', as: 'view'
  get 'mainpage/edit', to: 'mainpage#edit', as: 'edit'
  get 'mainpage/create_order', to: 'mainpage#create_order', as: 'payment'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
