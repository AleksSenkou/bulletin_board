Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:show]
  resources :adverts, except: [:index]
  resources :pictures, only: [:delete]
  root 'static_pages#home'
end
