Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :categories, only: %i[index new create edit update destroy]

  resources :purchases, only: %i[new create index edit update destroy]
end
