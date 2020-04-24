Rails.application.routes.draw do
  root "tops#index"

  resources :exhibition, only:[:index]
end
