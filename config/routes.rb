Rails.application.routes.draw do
  # get 'purchase/index'
  # get 'purchase/done'
  # get 'card/new'
  # get 'card/show'
  devise_for :users
  root "tops#index"

  resources :exhibition, only:[:index]
  resources :detail_pages, only: [:index]
  resources :users, only:[:index]
  resources :logout, only:[:index]
  resources :credit,only:[:index,:new,:show] do
    collection do
      post 'new', to: 'credit#new'
      post 'pay', to: 'credit#pay'
      post 'delete', to: 'credit#delete'
      post 'show', to: 'credit#show'
    end
  end
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  resources :confirmation_pages, only: [:index] do
    collection do
      get 'index', to: 'confirmation_pages#index'
      post 'pay', to: 'confirmation_pages#pay'
      get 'done', to: 'confirmation_pages#done'
    end
  end
  resources :commodities do
    member do
      post 'pay', to: 'confirmation_pages#pay'
    end
  end
end
