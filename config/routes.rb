Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:show]
  root 'static_pages#home'
end
