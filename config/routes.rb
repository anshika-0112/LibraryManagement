Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about',to: 'pages#about'

  resources :books
  resources :book_registries

  resources :categories

  devise_for :users
  get 'users', to:'users#index'
  get "users/:id", to: "users#show", as: "user"
  delete 'users/:id', to:'users#destroy'
end
