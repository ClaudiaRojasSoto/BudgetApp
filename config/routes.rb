# config/routes.rb
Rails.application.routes.draw do
  get 'home/index'
  get 'home/start'
  root to: 'home#index'

  devise_for :users

  resources :categories, only: %i[index new create edit update destroy]
  resources :purchases, only: %i[index new create edit update destroy]

  resources :purchase_categories, only: %i[index new create edit update destroy]
end
