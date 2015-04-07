Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:show]
  resources :adverts, except: [:index]
  get 'delete_photo_data' => "advert#delete_photo_data"
  root 'static_pages#home'
end
