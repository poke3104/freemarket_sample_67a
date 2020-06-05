Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root "tops#index"

  resources :detail_pages, only: [:index]
  resources :mypages, only:[:index] do
    collection do
      get 'logout'
    end
  end
  resources :credit,only:[:index]
  resources :exhibition, only:[:new] do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :confirmation_pages, only: [:index]
  resources :complete_pages, only: [:index]
end
