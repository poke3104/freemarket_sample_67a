Rails.application.routes.draw do
  root "tops#index"

  resources :exhibition, only:[:index]
  resources :detail_pages, only: [:index]
  resources :users, only:[:index]
  resources :logout, only:[:index]
  resources :credit,only:[:index]
  resources :confirmation_pages, only: [:index]
end
