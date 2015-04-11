Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show, :destroy]
  resources :adverts
  resources :pictures, only: [:show, :destroy]
  root 'static_pages#home'
end
