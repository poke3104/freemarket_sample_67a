Rails.application.routes.draw do
  # devise_for :users
  root "tops#index"

  resources :exhibition, only:[:index, :new, :create]
  resources :detail_pages, only: [:index]
  resources :users, only:[:index]
  resources :logout, only:[:index]
  resources :credit,only:[:index]
  resources :confirmation_pages, only: [:index]
end
