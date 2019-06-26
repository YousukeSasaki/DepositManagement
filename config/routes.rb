Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources 'users', only: :show

  resources 'transactions', except: :new do
    collection do
      get 'customer_choice'
      get 'new_choice'
    end
  end
  resource 'transactions', path: 'transactions/c:customer_id', only: :new
  resource 'transactions', action: 'customer', path: 'transactions/c:customer_id', only: :show, as: 'customer_transactions'

  namespace :api do
    resources 'transactions', only: [:number, :select], defaults: { format: 'json' } do
      collection do
        get 'number'
        get 'select'
      end
    end
  end

  resources 'customers'
  resources 'institutions'
  resources 'subjects'
end
