Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :users do
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
  resources :credit,only:[:index,:new,:show] do
    collection do
      post 'pay', to: 'credit#pay'
      post 'delete', to: 'credit#delete'
      post 'show', to: 'credit#show'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  resources :confirmation_pages, only: [:index] do
    collection do
      post 'pay', to: 'confirmation_pages#pay'
      get 'done', to: 'confirmation_pages#done'
    end
  end
  resources :commodities do
    member do
      post 'pay', to: 'confirmation_pages#pay'
    end
  end
  resources :exhibition, only:[:new] do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :confirmation_pages, only: [:index]
  resources :complete_pages, only: [:index]
end
