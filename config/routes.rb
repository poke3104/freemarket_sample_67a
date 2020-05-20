Rails.application.routes.draw do
  devise_for :users
  root "tops#index"

  resources :detail_pages, only: [:index]
  resources :users, only:[:index]
  resources :logout, only:[:index]
  resources :credit,only:[:index]
  resources :exhibition, only:[:new] do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :confirmation_pages, only: [:index]
end
