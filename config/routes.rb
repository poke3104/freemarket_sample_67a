Rails.application.routes.draw do
  # devise_for :users
  root "tops#index"

  resources :detail_pages, only: [:index]
  resources :users, only:[:index]
  resources :logout, only:[:index]
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
  resources :commodities, only: [:new, :create] do

    member do
      post 'pay', to: 'confirmation_pages#pay'
    end
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
  # resources :exhibition, only:[:new, :create] do
  #   collection do
  #     get 'category_children', defaults: { format: 'json' }
  #     get 'category_grandchildren', defaults: { format: 'json' }
  #   end
  # end
  resources :sighup_pages, only:[:index]
end
