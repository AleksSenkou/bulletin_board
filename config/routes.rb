Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:show, :destroy]
  resources :adverts, except: [:index]
  resources :pictures, only: [:show, :destroy]

  get 'admin/users', to: 'admins#all_users', as: 'all_users'
  get 'admin/adverts', to: 'admins#all_adverts', as: 'all_adverts'

  root 'static_pages#home'
end
