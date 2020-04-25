Rails.application.routes.draw do
  root "tops#index"

  resources :detail_pages, only: [:index]
  resources :confirmation_pages, only: [:index]
end
