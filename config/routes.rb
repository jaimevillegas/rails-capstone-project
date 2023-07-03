Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'splash_screen', to: 'splash_screen#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
