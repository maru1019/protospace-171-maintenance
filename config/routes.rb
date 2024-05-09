Rails.application.routes.draw do
  root to: 'prototypes#index'
  resources :prototypes, only: [:index, :create, :new]
end
