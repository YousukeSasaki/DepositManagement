Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources 'users', only: :show
  resources 'transactions'
  resources 'institutions'
  resources 'customers'
  resources 'subjects'
end
